class Property < ApplicationRecord
	has_one :amenity, dependent: :destroy, inverse_of: :property
	accepts_nested_attributes_for :amenity, update_only: true 
end
