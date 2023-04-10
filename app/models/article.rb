class Article < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 5}
end
