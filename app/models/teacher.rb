class Teacher < ApplicationRecord
  has_secure_password
  has_many :courses
  has_many :student_teacher_pairs
  has_many :students, through: :student_teacher_pairs

  def full_name
    full_name = "#{first_name} #{last_name}"
  end
end
