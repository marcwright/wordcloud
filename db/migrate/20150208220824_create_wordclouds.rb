class CreateWordclouds < ActiveRecord::Migration
  def change
    create_table :wordclouds do |t|

      t.timestamps null: false
    end
  end
end
