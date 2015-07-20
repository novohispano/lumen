class AddTimestampsToPhotos < ActiveRecord::Migration
  def up
    add_column :photos, :created_at, :datetime
    add_column :photos, :updated_at, :datetime

    Photo.all.each do |photo|
      photo.created_at = DateTime.now
      photo.updated_at = photo.created_at
      photo.save!
    end
  end

  def down
    remove_column :photos, :created_at, :datetime
    remove_column :photos, :updated_at, :datetime
  end
end
