class AddSiteIdToTreatment < ActiveRecord::Migration
  def change
    add_column :treatments, :site_id, :integer
    add_index :treatments, :site_id
  end
end
