class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :icon
      t.string :title
      t.string :description
      t.timestamps null: false
    end
  end
end
