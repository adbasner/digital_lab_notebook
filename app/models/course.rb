class Course < ApplicationRecord
  has_many :labs
  belongs_to :teacher
  has_many :student_teacher_pairs
  has_many :students, through: :student_teacher_pairs
end
