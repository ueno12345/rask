class CreateActionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :action_items do |t|
      t.integer :uid
      t.string :task_url

      t.timestamps
    end
  end
end
