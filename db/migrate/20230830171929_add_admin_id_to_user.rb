class AddAdminIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :admin, foreign_key: true
  end
end
