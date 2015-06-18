FactoryGirl.define do
  factory :payoff do
    project nil
    name "Test Payoff"
    url "http://www.example.com/"
    payoff_api_url "https://www.livepaperapi.com/api/v1/payoffs/0"
  end
end
