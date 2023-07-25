class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
end
