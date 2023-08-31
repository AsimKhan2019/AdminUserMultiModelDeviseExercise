class AddAccountReferenceToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_reference :admins, :account, null: false, foreign_key: true
  end
end
