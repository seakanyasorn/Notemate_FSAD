class SubjectRequest < ApplicationRecord
  belongs_to :user
  belongs_to :subject, optional: true  # Subject is optional until approved
  
  validates :name, presence: true
end
