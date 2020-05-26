require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /profile" do
    it "returns http success" do
      get "/pages/profile"
      expect(response).to have_http_status(:success)
    end
  end

end
