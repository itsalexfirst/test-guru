class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :all_by_category, -> (category) { joins(:category).where(categories: { title: category }) }
end
