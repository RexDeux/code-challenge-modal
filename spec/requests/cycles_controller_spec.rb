require "rails_helper"

RSpec.describe "CyclesController", :type => :request do
  describe 'GET /' do
    let!(:visible_cycle) { create :cycle, public_status: true }

    it "shows a list of cycles" do
      get "/"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include visible_cycle.name
    end
  end
end
