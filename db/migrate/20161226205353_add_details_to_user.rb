class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hub_type, :string
    add_column :users, :phone_no, :string
    add_column :users, :about, :text
    add_column :users, :avatar, :string
    add_column :users, :interest, :string
    add_column :users, :cover_img, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
  end
end
