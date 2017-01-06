class CreateInterestgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :interestgroups do |t|
      t.string :post

      t.timestamps
    end
  end
end
