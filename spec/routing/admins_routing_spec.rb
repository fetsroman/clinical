require "rails_helper"

RSpec.describe AdminsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin").to route_to("admins#index")
    end

    it "routes to #show" do
      expect(:get => "/admin/1").to route_to("admins#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin").to route_to("admins#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/1").to route_to("admins#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/1").to route_to("admins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/1").to route_to("admins#destroy", :id => "1")
    end
  end
end
