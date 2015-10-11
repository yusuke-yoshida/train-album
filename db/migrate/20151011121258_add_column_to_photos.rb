class AddColumnToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :flickr_id, :string
    add_column :photos, :title, :string
    add_column :photos, :link_url, :string
    add_column :photos, :thumbnail_url, :string
    add_column :photos, :original_url, :string
  end
  
  def down
  end
end
