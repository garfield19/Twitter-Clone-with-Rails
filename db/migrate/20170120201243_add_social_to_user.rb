class AddSocialToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ig, :string
    add_column :users, :whatsapp, :string
    add_column :users, :bbm, :string
    add_column :users, :facebook, :string
    add_column :users, :skills, :string
  end
end
