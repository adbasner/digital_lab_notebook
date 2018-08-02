json.array! @classrooms, partial: 'classroom', as: :classroom

# json.array! @classrooms.each do |classroom|
#   json.id classroom.id
#   json.teacher_id classroom.teacher_id
#   json.student_id classroom.student_id
#   json.course_id classroom.course_id
#   json.teacher classroom.teacher
#   json.students classroom.student
#   json.course classroom.course
# end

# json.classrooms @classrooms