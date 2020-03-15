class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :added_tests , class_name: 'Test', foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
