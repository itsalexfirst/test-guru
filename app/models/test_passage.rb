class TestPassage < ApplicationRecord
  SUCCESS_LIMIT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_find_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions +=1
    end

    save!
  end

  def success_rate
    number_of_questions == 0 ? 100 : number_of_questions ? correct_questions.to_f / number_of_questions * 100 : 100
  end

  def number_of_questions
    test.questions.count
  end

  def success?
    success_rate >= SUCCESS_LIMIT
  end

  def current_question_number
    number_of_questions - questions_order.count
  end

  def timer?
    test.timer > 0
  end

  def expired_at
    created_at + test.timer.minutes
  end

  def time_is_over?
    expired_at < Time.now
  end

  private

  def before_validation_find_question
    self.current_question = (new_record? ? test.questions.first : next_question)
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    questions_order.first
  end

  def questions_order
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
