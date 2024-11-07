class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes, dependent: :destroy
  has_many :report_issues  # Ensure this line is added
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  # Set default value for admin to false
  after_initialize :set_defaults, if: :new_record?

  def admin?
    self.admin == true
  end

  private

  def set_defaults
    self.admin ||= false
  end
end
