class FavoritesController < ApplicationController
    before_action :logged_in_user
    
    def create
        if params[:id]
            @photo = Photo.find_or_initialize_by(id: params[:id])
        else
            @photo = Photo.find(params[:photo_id])
        end
        
        # photosテーブルに存在しない場合はFlickrのデータを登録する。
        if @photo.new_record?
            
            @photo.flickr_id = photo.id
            @photo.title = photo.title
            @photo.link_url = "http://www.flickr.com/photos/#{photo.owner}/#{photo.id}"
            @photo.thumbnail_url = "http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_n.jpg"
            @photo.original_url = "http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_o.jpg"
            @photo.save!
        end
        
        current_user.favorite(@photo)
    end
    
    def destroy
        @photo = current_user.favorites.find(params[:id]).photo
        current_user.unfavorite(@photo)
    end
end
