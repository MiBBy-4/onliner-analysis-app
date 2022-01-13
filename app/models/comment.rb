class Comment < ApplicationRecord
  validates :comment
  validates :username

  has_one :article_comment
  has_one :article, through: :article_comments
end
