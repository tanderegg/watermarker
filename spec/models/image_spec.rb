require 'rails_helper'

RSpec.describe Image, type: :model do
  let!(:image) { FactoryGirl.build(:image) }
  
  it "can be created" do
    user = User.create!(:username => "test_user", :email => "test@example.com", :password => "password")
    project = Project.create!(:user => user, :name => "test_project", :client => "test_client", :logo => "http://example.com/test_logo.jpg")
    image.project = project
    image.save!
    expect(image != nil)
  end

  it "requires project, name, and original" do
    expect(Image.new).to be_invalid
  end
end
