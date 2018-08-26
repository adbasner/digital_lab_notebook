class ChangeDatatoDatumInNbs < ActiveRecord::Migration[5.2]
  def change
    rename_column :notebook_sections, :data, :datum
  end
end
