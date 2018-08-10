class Lab < ApplicationRecord
  has_many :notebook_sections
  belongs_to :course
end
