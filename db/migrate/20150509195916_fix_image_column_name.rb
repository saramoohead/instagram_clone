class FixImageColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :image, :description
  end
end
