class AddTrainerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :trainer, :boolean
  end
end
