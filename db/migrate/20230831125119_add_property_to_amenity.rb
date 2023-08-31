class AddPropertyToAmenity < ActiveRecord::Migration[7.0]
  def change
    add_reference :amenities, :property, foreign_key: true
  end
end
