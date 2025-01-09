class CreateDocumentTags < ActiveRecord::Migration[6.1]
  def change
    create_table :document_tags, id: false do |t|
      t.references :document, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
