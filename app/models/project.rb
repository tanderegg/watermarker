class Project < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, allow_blank: false
  validates_presence_of :name, allow_blank: false
  validates_presence_of :client, allow_blank: false
  validates_presence_of :logo, allow_blank: false
  validates_format_of :logo, :with => URI::regexp(%w(http https))
end
