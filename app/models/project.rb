class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :restrict_with_exception
  has_many :documents, dependent: :restrict_with_exception
  validates :name, presence: true
end
