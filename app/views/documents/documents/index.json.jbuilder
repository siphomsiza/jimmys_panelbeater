json.array!(@documents_documents) do |documents_document|
  json.extract! documents_document, :id, :category_id, :name, :data
end
