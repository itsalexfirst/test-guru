class User < ApplicationRecord

  def passed_tests(level)
    PassedTest.where('user_id = ?', self.id).joins('INNER JOIN "tests" ON "tests"."id" = "passed_tests"."test_id"').where('tests.level = ?', level)
  end
end
