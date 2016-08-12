class AddSiteIdToTestimonial < ActiveRecord::Migration
  def change
    add_column :testimonials, :site_id, :integer
    add_index :testimonials, :site_id
  end
end
