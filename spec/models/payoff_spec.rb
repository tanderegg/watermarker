require 'rails_helper'

RSpec.describe Payoff, type: :model do
  it "can be created" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
    payoff = Payoff.create!(:project => project, :name => "test_payoff", :url => "http://www.example.com/", :payoff_api_url => "https://www.livepaperapi.com/api/v1/payoffs/0")
    expect(payoff != nil)
  end

  it "requires project, name, and url" do
    expect(Payoff.new).to be_invalid
  end

  it "requires url to be a URL" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
    expect(Payoff.new(:project => project, :name => "test_payoff", :url => "blah")).to be_invalid
  end

  it "requires payoff_api_url to be a URL" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
    expect(Payoff.new(:project => project, :name => "test_payoff", :url => "http://www.example.com/", :payoff_api_url => "blah")).to be_invalid
  end
end
