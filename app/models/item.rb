class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :days
  belongs_to :status
  belongs_to :user
  has_one_attached :image
  

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :burden_id, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 ,message: "can't be blank"} 
  validates :days_id, numericality: { other_than: 1 ,message: "can't be blank"} 
end