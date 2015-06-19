require 'live_paper'

class Region < ActiveRecord::Base
  include LivePaper

  belongs_to :image
  belongs_to :payoff

  validates :name, :presence => true
  validates :image, :presence => true
  validates :payoff, :presence => true

  accepts_nested_attributes_for :payoff

  before_save :sync_with_livepaper
  after_destroy :destroy_with_livepaper

  private
  
  def sync_with_livepaper
    #connect to livepaper
    user = self.image.project.user
    lp = LivePaper.auth({id: user.client_id, secret: user.client_secret})

    # If no trigger has been created for this region, create it
    if self.trigger_api_url.blank?
      # Generate a trigger name based on the region's name
      trigger_name = "#{self.name}_trigger"
      
      # Create remote resouces
      trigger   = WmTrigger.create(name: trigger_name)
      puts self.payoff.payoff_api_url
      link      = Link.create(payoff_id: self.payoff.payoff_api_url.split('/')[-1], trigger_id: trigger.id, name: "#{self.name}_#{self.payoff.name}_link")

      # Save back URL's
      self.trigger_api_url  = "#{Trigger.api_url}/#{trigger.id}"
      self.link_api_url     = "#{Link.api_url}/${link.id}"
    else
      # If the name of the region has changed, update the trigger appropriately
      if self.name_changed?
        trigger = WmTrigger.get(self.trigger_api_url.split("/")[-1])
        trigger.name = self.name
        trigger.update
      end

      # If the payoff has changed, it may be a new payoff, update the link
      if self.payoff_changed?
        link = Link.get(self.link_api_url.split("/")[-1])
        link.payoff_id = self.payoff.payoff_api_url.split("/")[-1]
        link.update
      end
    end
  end

  def destroy_with_livepaper
    trigger = WmTrigger.get(self.trigger_api_url.split("/")[-1])
    trigger.delete

    link = Link.get(self.link_api_url.split("/")[-1])
    link.delete
  end
end
