module TasksHelper
  def days_to_deadline_as_string(task)
    days = task.days_to_deadline
    if days.finite?
      "期限まで後" + days.round.to_s + "日です！"
    else
      ""
    end
  end
end
