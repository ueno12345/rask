class Tag < ApplicationRecord
  has_many :task_tags, dependent: :destroy
  has_many :tasks, through: :task_tags
  has_many :document_tags, dependent: :destroy
  has_many :documents, through: :document_tags
  validates :name, presence: true, uniqueness: true
end
