class ChangeDataToDatumInNbdata < ActiveRecord::Migration[5.2]
  def change
    rename_column :notebook_data, :data, :datum
  end
end
