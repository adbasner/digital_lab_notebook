class NotebookDatum < ApplicationRecord
  belongs_to :student
  belongs_to :notebook_section
end
