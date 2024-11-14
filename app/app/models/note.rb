class Note < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  belongs_to :institution
  has_one_attached :file
  # has_many :report_issues
  has_many :report_issues, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :subject_id, presence: true
  validates :institution_id, presence: true
  validates :user_id, presence: true
  validates :rating, inclusion: { in: 1..5 }
  
  # validates_attachment_content_type :file, content_type: ['application/pdf', 'application/msword', 'text/plain']

  def save_file_with_semester_and_year(uploaded_file)
    filename = "#{semester}_#{year}_#{uploaded_file.original_filename}"
    file.attach(io: uploaded_file.tempfile, filename: filename)
  end
end