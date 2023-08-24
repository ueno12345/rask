class AddPrimaryKeyToDocumentTags < ActiveRecord::Migration[6.1]
  def change
    add_column :document_tags, :id, :primary_key
  end
end
