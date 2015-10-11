class AddColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :title, :string
    add_column :photos, :link_url, :string
    add_column :photos, :thumbnail_url, :string
    add_column :photos, :original_url, :string
  end
end
