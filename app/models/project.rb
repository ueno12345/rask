class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :restrict_with_exception
  has_many :documents
  validates :name, presence: true
end
