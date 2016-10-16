class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tags

  validates_presence_of :title, :content, :user_id
  validates :title, length: 5..50
  validates :content, length: { minimum: 100 }
end