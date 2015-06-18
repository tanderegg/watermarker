# encoding: utf-8

FactoryGirl.define do
  factory :image do
    name "Test"
    original Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/app/assets/images/rails-logo.jpg')))
  end
end