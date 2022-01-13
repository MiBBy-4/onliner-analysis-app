class Comment < ApplicationRecord
  validates :comment
  validates :username

  has_one :article
end
