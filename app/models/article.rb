class Article < ApplicationRecord
  validates :link, presence: true, length: { maximum: 500 }, url: { accept_array: true }
  validates :title, length: { minimum: 3 }

  has_many :comments
  after_commit :save_comments, on: :create

  private 
  
  def save_comments
    CreateCommentService.call(link, id)
  end
end
