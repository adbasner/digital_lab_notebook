class Student < ApplicationRecord
  has_many :labs
  has_many :classrooms
  has_many :teachers, through: :classrooms
  has_many :courses, through: :classrooms
end
