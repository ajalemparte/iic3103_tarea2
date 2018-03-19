class Article < ApplicationRecord
	validates :title, presence: true
  validates :subtitle, length: { maximum: 200 }
end
