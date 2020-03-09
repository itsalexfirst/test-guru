# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backend')
category3 = Category.create(title: 'Mobile')


test1 = Test.create(title: 'HTML',  level: 1, category_id: category1.id)
test2 = Test.create(title: 'RUBY',  level: 2, category_id: category2.id)
test3 = Test.create(title: 'CSS',   level: 2, category_id: category1.id)
test4 = Test.create(title: 'JAVA',  level: 2, category_id: category1.id)
test5 = Test.create(title: 'SWIFT', level: 3, category_id: category3.id)

test_all = [test1, test2, test3, test4, test5]

user1 = User.create(name: 'user1', password: 'password1')
user2 = User.create(name: 'user2', password: 'password2')
user3 = User.create(name: 'user3', password: 'password3')

4.times do |i|
  test_all.each do |test|
    question = Question.create(body: "Question#{i+1}", test_id: test.id)
    Answer.create(correct: true, question_id: question.id)
    Answer.create(question_id: question.id)
  end
end

