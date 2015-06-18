require 'rails_helper'

RSpec.describe Project, type: :model do
  it "can be created" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
  end

  it "requires a name, user, client, and logo" do
    expect(Project.new).to be_invalid
  end

  it "requires logo to be a URL" do
    user = User.create!(:username => "test", :email => "test@example.com", :password => "password")
    expect(Project.new(:user => user, :name => "test_project", :client => "test_client", :logo => "test_logo")).to be_invalid
  end
end
