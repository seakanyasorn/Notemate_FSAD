class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  validates :account_balance, comparison: {greater_than_or_equal_to: 0}

  def deposit(amount, target)
    self.account_balance -= amount
    target.account_balance += amount

    Physician.transaction do
      raise "Transaction falied" unless self.save && target.save

      # begin
      #   self.save
      #   target.save
      # rescue
      #   throw "Transaction failed"
      # end
    end
  end
end
