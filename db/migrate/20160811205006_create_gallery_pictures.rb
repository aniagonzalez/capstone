class CreateGalleryPictures < ActiveRecord::Migration
  def change
    create_table :gallery_pictures do |t|
      t.string :image_thumb
      t.string :image_large
      t.string :image_alt
      
      t.timestamps null: false
    end
  end
end
