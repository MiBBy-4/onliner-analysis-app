class Comment < ApplicationRecord
  validates :comment, presence :true, length: { maximum: 1000 }
  validates_associated :article

  belongs_to :article
end
