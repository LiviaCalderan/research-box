require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "POST /searches" do
    context "valid user_search" do
      it "creates a new search and returns HTTP 201" do
        headers = { "CONTENT_TYPE" => "application/json"}
        post "/searches", params: {user_search: "testing search"}.to_json, headers: headers
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["user_search"]).to eq("testing search")
        expect(Search.count).to eq(1)
      end
    end

    context "with blank user_search" do
      it "not create a search and returns HTTP 200" do
        headers = { "CONTENT_TYPE" => "application/json" }
        post "/searches", params: { user_search: "" }.to_json, headers: headers

        expect(response).to have_http_status(:ok)
        expect(Search.count).to eq(0)
      end
    end
  end

  describe "GET /searches" do
    before do
      2.times { Search.create!(user_search: "test2times", user_ip: "10.0.0.1") }
      Search.create!(user_search: "test1", user_ip: "10.0.0.1")
      Search.create!(user_search: "other", user_ip: "10.0.0.3")
    end

    context "when ip param is present" do
      it "returns top searches grouped by user_search" do
        get "/searches", params: { ip: "10.0.0.1" }

        expect(response).to have_http_status(:success)
        expect(assigns(:searches)).to eq({ "test2times" => 2, "test1" => 1 })
      end
    end

    context "when ip param is missing" do
      it "returns an empty array" do
        get "/searches"

        expect(response).to have_http_status(:success)
        expect(assigns(:searches)).to eq([])
      end
    end
  end

  it "trims user_search before save" do
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/searches", params: { user_search: "   hello world   " }.to_json, headers: headers

    expect(response).to have_http_status(:created)
    expect(Search.last.user_search).to eq("hello world")
  end

  it "when there are no searches for the ip returns empty hash" do
    get "/searches", params: { ip: "10.0.0.1" }

    expect(response).to have_http_status(:success)
    expect(assigns(:searches)).to eq({})
  end
end
