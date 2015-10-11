class Photo < ActiveRecord::Base
    has_many :users
end
