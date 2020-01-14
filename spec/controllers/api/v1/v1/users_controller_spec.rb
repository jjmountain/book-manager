require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe "GET #index" do
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected user attributes" do
      json_response = JSON.parse(response.body)
      binding.pry
      expect(json_response.keys).to match_array([:id, :balance, :full_name, :acc_number, :loans])
    end
  end
end