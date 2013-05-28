require 'spec_helper'

describe PropertiesController do
  	render_views

  	describe "#index" do
  		fixtures :properties

  		context "no search" do
  			it "should return all properties" do
  				get :index
  				assigns(:properties).should == Property.all
  			end
  		end

  		context "search" do
  			it "should return relevant properties" do
  				get :index, {:search => 'house'}
  				assigns(:properties).should == Property.where("name LIKE ?", "%house%")
  			end
  		end
  	end

end