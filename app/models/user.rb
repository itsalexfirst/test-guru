class User < ApplicationRecord

  def passed_tests(level)
    test_by_level = []
    PassedTest.where(user_id: self.id).each do |passed_test|
      id = passed_test.test_id
      test = Tests.find(id)
      test_by_level << test.title if test.level == level
    end
    test_by_level
  end
end
