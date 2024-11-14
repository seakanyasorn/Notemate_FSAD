class ReportIssue < ApplicationRecord
  belongs_to :user
  belongs_to :note, optional: true # Allows for reports that may not be linked to a specific note
  belongs_to :review, optional: true # Add this line if you haven’t already
end
