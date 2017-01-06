class AddInterestToInterestgroups < ActiveRecord::Migration[5.0]
  def change
    add_column :interestgroups, :interest, :string
    add_column :interestgroups, :type, :string
  end
end
