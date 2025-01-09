# coding: utf-8
class Task < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  belongs_to :assigner, foreign_key: 'assigner_id', class_name: 'User'
  belongs_to :project, optional: true
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags
  accepts_nested_attributes_for :task_tags, allow_destroy: true
  belongs_to :state, foreign_key: 'task_state_id', class_name: 'TaskState'
  
  scope :desc, -> (limit=nil) {order(updated_at: "DESC").limit(limit)}
  scope :asc, -> (limit=nil) {order(updated_at: "ASC").limit(limit)}
  scope :active, -> {joins(:state).where(state: {name: "todo"})}

  validates :content, presence: true

  def show_days_ago
    ((Time.zone.now - self.created_at)/60/60/24)
  end
  def days_to_deadline
    return Float::INFINITY unless self.due_at
    ((self.due_at - Time.zone.now)/60/60/24)
  end

  def overdue?
    return false unless self.due_at
    Time.zone.now.after?(self.due_at)
  end

  def completed?
    self.state.name == "done"
  end

end
