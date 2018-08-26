class Student < ApplicationRecord
  has_secure_password
  has_many :student_teacher_pairs
  has_many :notebook_data
  has_many :teachers, through: :student_teacher_pairs
  has_many :courses, through: :student_teacher_pairs

  def full_name
    full_name = "#{first_name} #{last_name}"
  end
end
