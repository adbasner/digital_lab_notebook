class CreateNotebookData < ActiveRecord::Migration[5.2]
  def change
    create_table :notebook_data do |t|
      t.integer :student_id
      t.string :data
      t.integer :notebook_section_id
      t.timestamps
    end
  end
end
