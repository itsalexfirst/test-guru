class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: 'User'

  def self.all_by_category(category)
    Test.joins(:category).where('categories.title = ?', category).order('tests.id DESC').pluck(:title)
  end
end
