class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
 validates :subtitle, length: { maximum: 200 }

 def self.findById id 
 	result = where(id: id).select(:id, :title, :subtitle, :body)
 end
end
