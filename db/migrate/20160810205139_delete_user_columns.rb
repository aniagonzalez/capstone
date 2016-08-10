class DeleteUserColumns < ActiveRecord::Migration
  def change
    remove_column :users, :baby_last_name
  end
end
