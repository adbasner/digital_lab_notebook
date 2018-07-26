class CreateNotebookSections < ActiveRecord::Migration[5.2]
  def change
    create_table :notebook_sections do |t|
      t.integer :lab_id
      t.integer :priority
      t.string :heading
      t.string :data
      t.boolean :student_can_edit
      t.timestamps
    end
  end
end
