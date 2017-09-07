class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :user_1_id, foreign_key: true
      t.integer :user_2_id, foreign_key: true

      t.timestamps
    end
  end
end
