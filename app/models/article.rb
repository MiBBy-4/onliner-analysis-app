class Article < ApplicationRecord
  validates :link, presence: true, length: { maximum: 500 }, url: { accept_array: true }
end
