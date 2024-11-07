class ReportIssue < ApplicationRecord
  belongs_to :user
  belongs_to :note, optional: true # Allows for reports that may not be linked to a specific note
end
