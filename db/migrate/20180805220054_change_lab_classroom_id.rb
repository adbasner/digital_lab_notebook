class ChangeLabClassroomId < ActiveRecord::Migration[5.2]
  def change
    rename_column :labs, :classroom_id, :course_id
  end
end
