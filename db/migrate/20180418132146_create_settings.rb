class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :title
      t.string :about
      t.string :embedded
    end
  end
end
