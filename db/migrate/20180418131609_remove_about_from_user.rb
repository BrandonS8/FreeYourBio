class RemoveAboutFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :about, :string
  end
end
