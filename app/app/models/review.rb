class Review < ApplicationRecord
  has_many :report_issues, dependent: :destroy
  belongs_to :subject
  validates :content, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
