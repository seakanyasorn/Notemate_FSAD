class Department < ApplicationRecord
  belongs_to :school
  has_many :subjects
  validates :name, presence: true, uniqueness: { scope: :school_id }
end
