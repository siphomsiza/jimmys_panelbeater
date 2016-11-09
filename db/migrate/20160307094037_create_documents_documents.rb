class CreateDocumentsDocuments < ActiveRecord::Migration
  def change
    create_table(:documents_documents, id: :uuid, default: "uuid_generate_v4()") do |t|
      t.string :name
      t.text :file
      t.references :category, index: true
      t.references :user, index: true
      t.integer :sort_index
      # t.text :data
      t.jsonb    :data, default: {}
      t.timestamps
    end
    add_index :documents_documents, :sort_index
  end
end
