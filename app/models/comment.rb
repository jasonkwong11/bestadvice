class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :content
  validates :content, length: 1..100
end