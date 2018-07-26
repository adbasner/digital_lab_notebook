class Classroom < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :course
end
