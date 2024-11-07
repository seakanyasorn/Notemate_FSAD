class Subject < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :subject_requests  # Optional, depending on your needs
  belongs_to :department, optional: true
  belongs_to :institution, optional: true  # Make this optional
  validates :name, presence: true, uniqueness: true
end