class Book < ApplicationRecord
	belongs_to :user
	attachment :image

  # titleは必須 200字以内
  validates :book_title, presence: true
  # validates :book_body, length: { in: 1..200 }
  # bodyは必須　200字以内
  validates :book_body, presence: true
  validates :book_body, length: { in: 1..200 }

end
