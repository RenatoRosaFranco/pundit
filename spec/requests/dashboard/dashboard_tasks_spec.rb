require 'rails_helper'

RSpec.describe "Dashboard::Tasks", type: :request do
  describe "GET /dashboard_tasks" do
    it "works! (now write some real specs)" do
      get dashboard_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
