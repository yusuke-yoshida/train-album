class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        if params[:flickr_id]
            @photo = Photo.find_or_initialize_by(flickr_id: params[:flickr_id])
        else
            @photo = Photo.find(params[:photo_id])
        end
        
        # photosテーブルに存在しない場合はFlickrのデータを登録する。
        if @photo.new_record?
            
            @photo_info = flickr.photos.getInfo(:photo_id => params[:flickr_id])
            @photo.flickr_id = @photo_info.id
            @photo.title = @photo_info.title
            @photo.link_url = FlickRaw.url_photopage(@photo_info)
            @photo.thumbnail_url = FlickRaw.url_n(@photo_info)
            @photo.original_url = FlickRaw.url_o(@photo_info)
            @photo.save!
        end
        
        current_user.favorite(@photo)
    end
    
    def destroy
        @photo = current_user.favorites.find(params[:id]).photo
        current_user.unfavorite(@photo)
    end
end
