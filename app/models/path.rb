class Path < ActiveRecord::Base
  decorate_with PathDecorator

  has_many :videos

  validates :title, presence: true
  validates :tag, presence: true

  def self.[](tag) find_by tag: tag end
  def to_param() tag end
end
