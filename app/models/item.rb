class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
