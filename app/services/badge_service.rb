class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule_name}?", badge.rule_value)
    end
  end

  private

  def category?(id)

  end

  def level?(level)

  end

  def attempt?(number)
    @user.tests.where(id: @test.id).count == number.to_i
  end

end
