class Comment < ApplicationRecord
  validates :comment
  validates :username

  belongs_to :article
end
