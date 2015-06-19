require 'live_paper'

class Payoff < ActiveRecord::Base
  include LivePaper

  belongs_to :project
  has_many :regions

  validates :project, :presence => true
  validates :url,
    :presence => true,
    :allow_blank => false,
    :format => { with: URI::regexp(%w(http https)), message: "must be a URL" }
  validates :payoff_api_url,
    :format => { with: URI::regexp(%w(http https)), message: "must be a URL" },
    :allow_nil => true

  before_save :sync_with_livepaper
  after_destroy :destroy_with_livepaper

  private

  def sync_with_livepaper
    #connect to livepaper
    user = self.project.user
    lp = LivePaper.auth({id: user.client_id, secret: user.client_secret})

    if not self.payoff_api_url
      payoff = Payoff.create(name: self.name, type: Payoff::TYPE[:WEB], url: self.url)
      self.payoff_api_url = "#{Payoff.api_url}/#{payoff.id}"
    elsif self.url_changed?
      payoff = Payoff.get(self.payoff_api_url.split('/')[-1])
      payoff.url = self.url
      payoff.update
    end
  end
  
  def destroy_with_livepaper
    payoff = Payoff.get(self.payoff_api_url.split('/')[-1])
    payoff.delete
  end
end
