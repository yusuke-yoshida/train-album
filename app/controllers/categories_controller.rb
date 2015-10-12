class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "カテゴリを追加しました！"
            redirect_to new_category_path
        else
          render new_category_path
        end
    end
    
    def show
        FlickRaw.api_key       = Rails.application.secrets.flickr_api_key
        FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secret
        word = @category.name
        @photos = flickr.photos.search(text: word, license: "1,2,3,4,5,6", sort: "relevance", per_page: 30)
    end
    
    private

    def category_params
        params.require(:category).permit(:name)
    end
    
    def set_category
        @category = Category.find(params[:id])
    end
end
