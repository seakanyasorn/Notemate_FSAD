class School < ApplicationRecord
  has_many :departments
  has_many :institutions
  validates :name, presence: true, uniqueness: true
end
