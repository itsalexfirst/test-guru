class AddTestLevelAndAnswerDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :level, false)
    change_column_default(:tests, :level, from: 0, to: 1)
    change_column_null(:questions, :body, false)
    change_column_default(:questions, :body, from: true, to: false)
  end
end
