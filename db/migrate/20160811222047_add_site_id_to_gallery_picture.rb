class AddSiteIdToGalleryPicture < ActiveRecord::Migration
  def change
    add_column :gallery_pictures, :site_id, :integer
    add_index :gallery_pictures, :site_id
  end
end
