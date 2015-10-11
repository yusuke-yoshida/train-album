class AddFlickridToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :flickr_id, :string
  end
end
