json.courses_attending do
  json.array! @courses, partial: 'course', as: :course
end

json.courses_not_attending do
  json.array! @not_enrolled, partial: 'course', as: :course
end

json.role @role