class Test < ApplicationRecord

  def self.all_by_category(category)
    category_id = Category.find_by(title: category).id
    Test.where(category: category_id).orfer('id DESC').pluck(:title)
  end
end
