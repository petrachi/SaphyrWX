class Video < ActiveRecord::Base
  decorate_with VideoDecorator

  belongs_to :path

  validates :title, presence: true
  validates :brief, presence: true
  validates :embed, presence: true
  validates :path_id, presence: true
end
