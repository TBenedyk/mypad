class PropertiesController < ApplicationController

  def index
	  if params[:search].present?
	    @properties = Property.where("name LIKE ?", "%#{params[:search]}%")
	  else
	    @properties = Property.all
	  end
  end

  def show
  	@property = Property.find(params[:id])
  	@nearby_properties = Property.related(@property)
  end

end