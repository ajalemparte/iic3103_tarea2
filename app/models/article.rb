class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true
  validates :subtitle, length: { maximum: 200 }
end
