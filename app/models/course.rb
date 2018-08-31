class Course < ApplicationRecord
  has_many :labs, dependent: :destroy
  belongs_to :teacher
  has_many :student_teacher_pairs, dependent: :destroy
  has_many :students, through: :student_teacher_pairs
end
