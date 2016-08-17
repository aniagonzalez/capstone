class CreateJsonData < ActiveRecord::Migration
  def change
    create_table :json_data do |t|
      t.json :gallery_json
      t.json :info_json
      t.json :team_json
      t.json :testimonials_json
      t.json :treatments_json
      t.timestamps null: false
    end
  end
end
