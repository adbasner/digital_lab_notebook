class ChangeCourseNameToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :course_name, :name
  end
end
