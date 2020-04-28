class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule_name}?", badge)
    end
  end

  private

  def category?(badge)
    return if @user.badges.include?(badge)
    (Test.all_by_category(badge.rule_value).ids - @user.test_passages.select{ |x| x.success? }.map(&:test_id)).empty?
  end

  def level?(badge)

  end

  def attempt?(badge)
    @user.tests.where(id: @test.id).count == badge.rule_value.to_i
  end

end
