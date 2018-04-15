class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :site
      t.string :title
      t.string :url
      t.string :img
    end
  end
end
