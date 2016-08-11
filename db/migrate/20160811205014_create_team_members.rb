class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :image
      t.string :email
      t.string :phone
      t.timestamps null: false
    end
  end
end
