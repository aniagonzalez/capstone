class Site < ActiveRecord::Base
  has_many :gallery_pictures
  has_many :team_members
  has_many :treatments
  has_many :testimonials
  belongs_to :user
end
