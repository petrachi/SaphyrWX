class Path < ActiveRecord::Base
  has_many :videos

  validates :yt_id, uniqueness: true

  def self.create_with_yt(playlist)
    create! do |path|
      path.yt_description = playlist.description
      path.yt_id = playlist.id
      path.yt_title = playlist.title

      path.tag = playlist.title.parameterize
    end
  end

  alias_attribute :title, :yt_title

  decorate_with PathDecorator

  scope :published, ->{ where published: true }
end
