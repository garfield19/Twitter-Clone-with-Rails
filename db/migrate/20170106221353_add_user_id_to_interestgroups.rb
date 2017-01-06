class AddUserIdToInterestgroups < ActiveRecord::Migration[5.0]
  def change
    add_column :interestgroups, :user_id, :integer
    add_index :interestgroups, :user_id
  end
end
