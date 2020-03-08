class Test < ApplicationRecord
  belongs_to :category

  def self.all_by_category(category)
    category_id = Category.find_by(title: category).id
    Test.where(category: category_id).order('id DESC').pluck(:title)
  end
end
