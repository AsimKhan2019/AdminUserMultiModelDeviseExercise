class Amenity < ApplicationRecord
	belongs_to :property, inverse_of: :amenity 
end
