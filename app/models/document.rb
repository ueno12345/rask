# coding: utf-8
class Document < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  belongs_to :assigner, foreign_key: 'assigner_id', class_name: 'User'
  belongs_to :project, optional: true

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :location, presence: true
  #validates :project, presence: true
  before_validation :add_unique_action_item_marker

  def add_unique_action_item_marker
    desc = ""
    self.description.each_line {|line|
      matched = line.match(/-->\((.+)\)/)
      if matched != nil
        @action_item = ActionItem.create(task_url: nil)
        line.gsub!(/-->\(.+\)/, "-->(#{matched[1]} !#{@action_item.uid})")
      end
      desc += line
    }
    self.description = desc
  end
end
