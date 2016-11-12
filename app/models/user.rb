class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :zxcvbnable
  has_many :posts
  has_many :comments, through: :posts
  has_many :tags, through: :posts
  

  def self.top_contributor_email
    user = User.all.max_by{|user| user.posts.count}
    user.email
  end

  def self.top_contributor_post_count
    user = User.all.max_by{|user| user.posts.count}
    user.posts.count
  end
end
