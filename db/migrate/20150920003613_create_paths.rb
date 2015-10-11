class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      # YT API
      t.string :yt_description
      t.string :yt_id
      t.string :yt_title

      # SaphyrWX
      t.string :tag

      t.timestamps null: false
    end
  end
end
