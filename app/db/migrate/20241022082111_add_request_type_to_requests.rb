class AddRequestTypeToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :request_type, :string
  end
end
