class Payoff < ActiveRecord::Base
  belongs_to :project

  validates :project, :presence => true
  validates :url,
    :presence => true,
    :allow_blank => false,
    :format => { with: URI::regexp(%w(http https)), message: "must be a URL" }
  validates :payoff_api_url,
    :format => { with: URI::regexp(%w(http https)), message: "must be a URL" }
end
