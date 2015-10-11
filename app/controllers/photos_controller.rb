class PhotosController < ApplicationController
    before_action :logged_in_user , except: [:show]
    
    def flickr_search(word)
        FlickRaw.api_key       = Rails.application.secrets.flickr_api_key
        FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secret
        word = "はやぶさ"
        @photos = flickr.photos.search(text: word, license: "1,2,3,4,5,6", sort: "relevance", per_page: 30)
    end
    
    def show
    end
    
end
