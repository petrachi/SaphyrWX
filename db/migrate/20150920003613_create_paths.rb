class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :title, null: false
      t.string :tag, null: false

      t.timestamps null: false
    end
  end
end
