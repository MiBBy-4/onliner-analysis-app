class Comment < ApplicationRecord
  validates :content, length: { maximum: 1000 }
  validates_associated :article

  belongs_to :article
end
