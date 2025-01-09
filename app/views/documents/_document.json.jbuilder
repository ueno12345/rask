json.extract! document, :id, :content, :creator_id, :description, :created_at, :updated_at, :project_id, :start_at, :end_at, :location
json.url document_url(document, format: :json)
