require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created" do
    user = User.create!(username: 'test_user', email: 'test_user@example.com', password: "password")
    expect(user != nil)
  end
end
