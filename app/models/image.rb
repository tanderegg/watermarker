# encoding: utf-8

class Image < ActiveRecord::Base
  belongs_to :project

  mount_uploader :original, ImageUploader

  validates :project, :presence => true
  validates :name, :presence => true
  validates :original,
    :presence => true
  validate :original_max_size

  private

  def original_max_size
    errors[:original] << "should be less than 10MB" if original.size > 10.megabytes
  end
end
