class Photo < ActiveRecord::Base
    belongs_to :category
    
    has_many :favorites, class_name: "Favorite", foreign_key: "photo_id", dependent: :destroy
    has_many :favoriting_users, through: :favorites, source: :user
end
