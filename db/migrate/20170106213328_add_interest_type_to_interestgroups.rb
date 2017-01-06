class AddInterestTypeToInterestgroups < ActiveRecord::Migration[5.0]
  def change
    add_column :interestgroups, :interesttype, :string
  end
end
