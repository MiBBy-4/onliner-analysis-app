class Comment < ApplicationRecord
<<<<<<< HEAD
  validates :content, presence: true, length: { maximum: 1000 }
=======
  validates :content, length: { maximum: 1000 }
>>>>>>> add_saving_all_dates_in_database
  validates_associated :article

  belongs_to :article
end
