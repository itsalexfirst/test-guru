class TestPassage < ApplicationRecord
  SUCCES_LIMIT = 85

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
    success_rate >= SUCCES_LIMIT
  end

  def current_question_number
    number_of_questions - questions_order.count
  end

  private

  def before_validation_find_question
    self.current_question = (new_record? ? test.questions.first : next_question)
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
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
