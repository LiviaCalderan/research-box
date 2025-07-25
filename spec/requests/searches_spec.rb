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
      it "does not create a search and returns status 200" do
        headers = { "CONTENT_TYPE" => "application/json" }
        post "/searches", params: { user_search: "" }.to_json, headers: headers

        expect(response).to have_http_status(:ok)
        expect(Search.count).to eq(0)
      end
    end
  end
end
