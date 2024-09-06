class AddAccountBalanceToPhysician < ActiveRecord::Migration[7.2]
  def change
    add_column :physicians, :account_balance, :float
  end
end
