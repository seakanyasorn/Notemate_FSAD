class Institution < ApplicationRecord
  has_many :notes
  belongs_to :school, optional: true # In case not every institution needs to be linked to a school
  has_many :subjects
  validates :name, presence: true
end
