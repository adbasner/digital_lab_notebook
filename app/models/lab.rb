class Lab < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  belongs_to :student
  has_many :notebook_sections
end
