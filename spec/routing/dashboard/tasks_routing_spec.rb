require "rails_helper"

RSpec.describe Dashboard::TasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dashboard/tasks").to route_to("dashboard/tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/dashboard/tasks/new").to route_to("dashboard/tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/dashboard/tasks/1").to route_to("dashboard/tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dashboard/tasks/1/edit").to route_to("dashboard/tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dashboard/tasks").to route_to("dashboard/tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dashboard/tasks/1").to route_to("dashboard/tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dashboard/tasks/1").to route_to("dashboard/tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dashboard/tasks/1").to route_to("dashboard/tasks#destroy", :id => "1")
    end

  end
end
