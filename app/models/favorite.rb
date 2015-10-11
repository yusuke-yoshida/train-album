class Favorite < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :photo, class_name: "Photo"
end
