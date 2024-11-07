class AddInstitutionNameToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :institution_name, :string
  end
end
