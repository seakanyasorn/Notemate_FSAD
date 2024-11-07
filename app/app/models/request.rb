class Request < ApplicationRecord
  belongs_to :user
  belongs_to :subject, optional: true
  belongs_to :institution, optional: true
  # validates :request_type, presence: true, inclusion: { in: ['subject', 'institution'] }
  validates :institution_name, presence: true, if: -> { request_type == 'institution' }
  validates :subject_name, presence: true, if: -> { request_type == 'subject' }
end
