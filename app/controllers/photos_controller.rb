class PhotosController < ApplicationController
    
    def new
        if params[:q]
            FlickRaw.api_key       = Rails.application.secrets.flickr_api_key
            FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secret
            word = params[:q]
            @photos = flickr.photos.search(text: word, license: "1,2,3,4,5,6", sort: "relevance", per_page: 30)
        end
    end
    
    def show
    end
    
end
