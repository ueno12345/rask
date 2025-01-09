class TaskState < ApplicationRecord
  has_many :tasks, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :priority, presence: true
end
