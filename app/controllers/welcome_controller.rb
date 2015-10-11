class WelcomeController < ApplicationController
  def index
    FlickRaw.api_key       = Rails.application.secrets.flickr_api_key
    FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secret
    word = "はやぶさ"
    @photos = flickr.photos.search(text: word, license: "1,2,3,4,5,6", sort: "relevance", per_page: 30)
  end
end
