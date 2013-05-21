class Property < ActiveRecord::Base
  attr_accessible :name, :bedroom_count, :latitude, :longitude

  reverse_geocoded_by :latitude, :longitude

  scope :related, lambda { |property| property.nearbys(20, { :order => :distance, :units => :km }).where("bedroom_count >= ?", property.bedroom_count) }

end