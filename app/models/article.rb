class Article < ApplicationRecord
  validates :link, presence: true, length: { maximum: 500 }, url: { accept_array: true }
  title :string, length: { minimum:3 }
  
end