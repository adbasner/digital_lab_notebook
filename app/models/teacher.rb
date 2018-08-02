class Teacher < ApplicationRecord
  has_secure_password
  has_many :classrooms
  has_many :students, through: :classrooms
  has_many :courses, through: :classrooms
end
