class Property < ApplicationRecord
	has_one :amenity
	accepts_nested_attributes_for :amenity
end
