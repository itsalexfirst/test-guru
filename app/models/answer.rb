class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_numbers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_numbers
    errors.add(:question, 'can`t contain more answers') if question.answers.size >=4
  end
end
