class CalculateScoreJob < ApplicationJob
  queue_as :default

  def perform(student_id)
    student = Student.find(student_id)

    
    score_value = rand(0..100)
    rank = Score.where("value > ?", score_value).count + 1

    
    score = Score.find_or_initialize_by(student: student)
    score.update(value: score_value, rank: rank)
  end
end
