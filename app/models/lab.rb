class Lab < ApplicationRecord
  has_many :notebook_sections, dependent: :destroy
  belongs_to :course
end
