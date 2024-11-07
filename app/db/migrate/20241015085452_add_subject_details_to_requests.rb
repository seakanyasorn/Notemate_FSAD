class AddSubjectDetailsToRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :requests, :subject_name, :string
  end
end
