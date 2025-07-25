require 'rails_helper'

RSpec.describe Search, type: :model do
  it "it's invalid without user_search" do
    search = Search.new(user_search: nil, user_ip: "10.0.0.1")
    expect(search).not_to be_valid
  end

  it "it's invalid without user_ip" do
    search = Search.new(user_search: "testing the application1", user_ip: nil)
    expect(search).not_to be_valid
  end

  it "it's valid with user_search and user_ip" do
    search = Search.new(user_search: "testing the application2", user_ip: "10.0.0.1")
    expect(search).to be_valid
  end

  it "is invalid when query is just spaces (even if front uses trim)" do
    search = Search.new(user_search: "    ", user_ip: "10.0.0.1")
    expect(search).not_to be_valid
  end

  it "strips whitespace from user_search before validation" do
    search = Search.new(user_search: "  search term  ", user_ip: "10.0.0.1")
    search.valid?
    expect(search.user_search).to eq("search term")
  end

end
