require 'rails_helper'

RSpec.describe "Degrees", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/degrees/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/degrees/update"
      expect(response).to have_http_status(:success)
    end
  end

end
