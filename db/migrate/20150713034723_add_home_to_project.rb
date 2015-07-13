class AddHomeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :home, :boolean
  end
end
