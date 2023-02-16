class RemoveAssignerIdFromDocuments < ActiveRecord::Migration[6.1]
  def change
    remove_column :documents, :assigner_id, :integer
  end
end
