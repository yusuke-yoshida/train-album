class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :photo, index: true

      t.timestamps null: false
      
      t.index [:user_id, :photo_id], unique: true
    end
  end
end
