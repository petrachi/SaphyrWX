class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      # YT API
      t.string :yt_description
      t.string :yt_duration
      t.string :yt_embed_html
      t.string :yt_id
      t.string :yt_published_at
      t.string :yt_thumbnail_url
      t.string :yt_title

      # SaphyrWX
      t.string :brief
      t.references :path, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
