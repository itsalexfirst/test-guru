class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :added_tests , class_name: 'Test', foreign_key: 'author_id'

  def passed_tests(level)
    PassedTest.where('user_id = ?', self.id).joins('INNER JOIN "tests" ON "tests"."id" = "passed_tests"."test_id"').where('tests.level = ?', level)
  end
end
