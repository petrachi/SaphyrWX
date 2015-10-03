class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :brief
      t.string :embed
      t.references :path, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
