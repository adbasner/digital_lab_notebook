class NotebookSection < ApplicationRecord
  belongs_to :lab
  has_many :notebook_data, dependent: :destroy
end
 