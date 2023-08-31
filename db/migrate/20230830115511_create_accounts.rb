class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.date :start_date
      t.date :end_date
      t.date :renewal_date
      t.date :trial_start_date
      t.date :trial_end_date
      t.date :billing_date
      t.integer :notice_period
      t.boolean :is_active
      t.boolean :has_expired
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
