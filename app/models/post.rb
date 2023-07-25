class Post < ApplicationRecord
  attr_accessor :new_category_name

  belongs_to :user
  belongs_to :category, optional: true

  validates :title, presence: true, length: { maximum: 100 }
  # , uniqueness: { case_sensitive: false }
  validates :title, presence: true, length: { maximum: 300 }
  validates :content, presence: true
  validates :date, presence: true
  validates :user, presence: true
  validates :category, presence: true
end
