class AddSliderToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :slider, :boolean
  end
end
