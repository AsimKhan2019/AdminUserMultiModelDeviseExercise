class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :plan_name
      t.integer :duration
      t.string :status
      t.decimal :price
      t.decimal :renewal_price

      t.timestamps
    end
  end
end
