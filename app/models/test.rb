class Test < ApplicationRecord
  belongs_to :category

  def self.all_by_category(category)
    Test.joins(:category).where('categories.title = ?', category).order('tests.id DESC').pluck(:title)
  end
end
