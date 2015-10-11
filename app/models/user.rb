class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :favorites, class_name: "Favorite", foreign_key: "user_id", dependent: :destroy
    has_many :favorite_photos, through: :favorites, source: :photo
    
    # 写真をお気に入りする
    def favorite(photo)
        favorites.find_or_create_by(photo_id: photo.id)
    end
    
    # お気に入りを解除する
    def unfavorite(photo)
        favorites.find_by(photo_id: photo.id).destroy
    end
    
    # ある写真をお気に入りしているかどうか？
    def favoriting?(photo)
        favorite_photos.include?(photo)
    end
    
end
