class Post < ApplicationRecord
  validates :name, presence: true
  validates :publishedOn, presence: true
  has_rich_text :content
end
