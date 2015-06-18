class Region < ActiveRecord::Base
  belongs_to :image
  belongs_to :payoff

  validates :name, :presence => true
  validates :image, :presence => true
  validates :payoff, :presence => true
end
