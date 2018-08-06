class CreateStudentTeacherPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :student_teacher_pairs do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.integer :course_id
      t.timestamps
    end
  end
end
