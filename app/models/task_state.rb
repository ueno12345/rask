class TaskState < ApplicationRecord
  has_many :tasks, dependent: :restrict_with_exception
end
