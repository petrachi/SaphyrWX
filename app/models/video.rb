class Video < ActiveRecord::Base
  belongs_to :path

  validates :yt_id, uniqueness: true

  def self.create_with_yt(yt_video, path:)
    create! do |video|
      video.yt_description = yt_video.description
      video.yt_duration = yt_video.duration
      video.yt_embed_html = yt_video.embed_html
      video.yt_id = yt_video.id
      video.yt_published_at = yt_video.published_at
      video.yt_thumbnail_url = yt_video.thumbnail_url :high
      video.yt_title = yt_video.title

      video.path = path
    end
  end

  alias_attribute :description, :yt_description
  alias_attribute :duration, :yt_duration
  alias_attribute :embed_html, :yt_embed_html
  alias_attribute :published_at, :yt_published_at
  alias_attribute :thumbnail_url, :yt_thumbnail_url
  alias_attribute :title, :yt_title

  decorate_with VideoDecorator

  scope :published, ->{ where published: true }
end
