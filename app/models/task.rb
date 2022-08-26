# coding: utf-8
class Task < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  belongs_to :assigner, foreign_key: 'assigner_id', class_name: 'User'
  belongs_to :project, optional: true
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  accepts_nested_attributes_for :task_tags, allow_destroy: true
  belongs_to :state, foreign_key: 'task_state_id', class_name: 'TaskState'

  def show_days_ago
    ((Time.zone.now - self.created_at)/60/60/24).round
  end
  def days_to_deadline
    ((self.due_at - Time.zone.now)/60/60/24).round
  end

  def overdue?
    Time.zone.now.before?(self.due_at)
  end
end
