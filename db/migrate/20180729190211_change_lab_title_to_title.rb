class ChangeLabTitleToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :labs, :lab_title, :title
  end
end
