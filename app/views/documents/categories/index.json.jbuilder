json.array!(@admin_accounts_documents_categories) do |admin_documents_category|
  json.extract! admin_documents_category, :id, :account_id, :name, :parent_id
end
