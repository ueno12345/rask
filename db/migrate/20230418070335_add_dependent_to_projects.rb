class AddDependentToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :tasks, :integer, :dependent => :restrict_with_exception
  end
end
