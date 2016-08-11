class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :logo, default: "svg/min/logo.svg"
      t.string :hero_img, default: "hero.jpg"
      t.string :hero_title
      t.string :hero_description
      t.string :api_token
      t.string :phone
      t.string :emergency
      t.string :email
      t.string :address
      t.string :monfri_hours
      t.string :sat_hours
      t.string :sun_hours
      t.string :testimonials_img, default: "parallax.jpg"
      t.string :address
      t.string :facebook, default: "http://facebook.com"
      t.string :twitter, default: "http://twitter.com"
      t.string :instagram, default: "http://instagram.com"
      t.string :youtube, default: "http://youtube.com"
      t.string :skype
      t.string :pie, default: "© 2016 - Todos los derechos reservados"

      t.timestamps null: false
    end
  end
end
