class DeleteOldTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :classrooms
    drop_table :studuent_teacher_pairs
  end
end
