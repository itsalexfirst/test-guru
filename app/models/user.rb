class User < ApplicationRecord

  def passed_tests(level)
    PassedTest.where('user_id = ?', self.id).joins(:test).where('tests.level = ?', level)
  end
end
