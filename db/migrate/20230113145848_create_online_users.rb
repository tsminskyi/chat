class CreateOnlineUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :online_users do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
