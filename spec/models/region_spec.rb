require 'rails_helper'

RSpec.describe Region, type: :model do
  let!(:image) { FactoryGirl.build(:image) }

  it "can be created" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
    payoff = Payoff.create!(:project => project, :name => "test_payoff", :url => "http://www.example.com/", :payoff_api_url => "https://www.livepaperapi.com/api/v1/payoffs/0")
    image.project = project
    image.save!
    region = Region.create!(:image => image, :payoff => payoff, :name => "test_region_1", :left => 0, :top => 0, :width => 20, :height => 20,
                            :original => "", :watermark => "", :watermark_strength => 1, :watermark_resolution => 1, :link_api_url => "https://www.livepaperapi.com/api/v1/links/0",
                            :trigger_api_url => "https://www.livepaperapi.com/api/v1/triggers/0")
    expect(region != nil)
  end

  it "requires image, payoff, name" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
    payoff = Payoff.create!(:project => project, :name => "test_payoff", :url => "http://www.example.com/", :payoff_api_url => "https://www.livepaperapi.com/api/v1/payoffs/0")
    image.project = project
    image.save!
    expect(Region.new).to be_invalid
  end
end
