class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :name
      t.string :owner
      t.string :email
      t.string :coverage

      t.timestamps
    end
  end
end
