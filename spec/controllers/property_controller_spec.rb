require 'spec_helper'

describe PropertiesController do
  	render_views

	describe "#show" do
		fixtures :properties

		before(:all) do
			@property = Property.first
		end

		it "should match the property" do
			@property.should be_instance_of Property
			Property.related(@property).should_not include(@property)
			get :show, :id => @property.id
			expect(response.body).to match("#{@property.name}")
		end

		it "should show the relevant property" do
			Property.related(@property).should_not include(@property)
			get :show, :id => @property.id
			expect(response.body).to match("#{@property.name}")
		end

		it "should not be further than 20km away" do
		  	properties = Property.related(@property)
		  	properties.each do |related|
		  		@property.distance_to(related).should be <= 20
		  		@property.bedroom_count.should be <= related.bedroom_count
		  	end
		end
	end

end