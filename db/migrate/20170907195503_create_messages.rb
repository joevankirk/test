class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user
      t.references :trainer
      t.timestamps
    end
  end
end
