class Comment < ApplicationRecord
 belongs_to :article
 validates :author, presence: true
 validates :comment, presence: true

 def self.findById id 
 	result = where(id: id).select(:id, :author, :comment)
 end
end
