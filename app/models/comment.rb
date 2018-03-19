class Comment < ApplicationRecord
  belongs_to :article
  validates :author, presence: true
  validates :comment, presence: true
end
