class DeletesOldTables < ActiveRecord::Migration[5.2]
  def down
    drop_table(classrooms)
    drop_table(studuent_teacher_pairs)
  end
end
