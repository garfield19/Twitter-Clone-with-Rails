class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
      add_index :updates, [:user_id, :created_at]
    
  end
end
