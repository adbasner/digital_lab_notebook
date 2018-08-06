class AddTeacherIdToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :teacher_id, :integer
  end
end
