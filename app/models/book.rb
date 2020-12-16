class Book < ApplicationRecord
  belongs_to :user
  
  validates :book_name, presence: true
  validates :body, presence: true,length: { maximum: 75 }
end
