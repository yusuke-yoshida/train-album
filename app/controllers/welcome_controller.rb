class WelcomeController < ApplicationController
  def index
    @photos = Photo.all.order("updated_at DESC").limit(30)
  end
end
