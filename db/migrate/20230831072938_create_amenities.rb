class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.boolean :has_pool
      t.boolean :has_garage
      t.boolean :has_balcony
      t.boolean :has_roof
      t.boolean :has_terrace
      t.boolean :has_kitchen
      t.boolean :has_storage
      t.boolean :has_barbq
      t.boolean :has_gym
      t.boolean :has_studio
      t.boolean :has_cinema

      t.timestamps
    end
  end
end
