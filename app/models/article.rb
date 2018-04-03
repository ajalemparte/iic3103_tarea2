class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
 validates :subtitle, length: { maximum: 200 }

 def truncate maximum 
 	if self.body.length >= maximum
    if end_word = self.body[0..maximum].rindex(" ")
    	self.body = self.body[0..(end_word - 1)] + '...'
    else
    	self.body = self.body[0..(maximum - 3)] + '...'
    end
  end 
 	# result = where(id: id).select(:id, :title, :subtitle, :body)
 end

 def self.findById id 
 	result = where(id: id).select(:id, :title, :subtitle, :body)
 end
end
