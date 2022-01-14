class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000 }
  validates_associated :article

  belongs_to :article
end
