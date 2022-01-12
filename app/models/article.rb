class Article < ApplicationRecord
  validates :link, presence: true, length: { maximum: 500 }, url: { accept_array: true }
  validates :title, length: { minimum:3 }

end