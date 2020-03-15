class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.all_by_category(category)
    Test.joins(:category).where('categories.title = ?', category).order('tests.id DESC').pluck(:title)
  end
end
