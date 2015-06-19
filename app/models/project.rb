# encoding: utf-8

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_many :payoffs

  validates :user, :presence => true, :allow_blank => false
  validates :name, :presence => true, :allow_blank => false
  validates :client, :presence => true, :allow_blank => false
  validates :logo,
    :presence => true,
    :allow_blank => false,
    :format => { with: URI::regexp(%w(http https)), message: "must be a URL" }
end
