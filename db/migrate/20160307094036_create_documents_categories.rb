class CreateDocumentsCategories < ActiveRecord::Migration
  def change
    create_table(:documents_categories, id: :uuid, default: "uuid_generate_v4()") do |t|
      t.string :name
      t.references :user,index: true
      t.references :parent, index: true
      t.string :colour
      t.integer :sort_index
      t.integer :children_categories_count, :integer, :null => false, :default => 0
      t.integer :documents_count, :integer, :null => false, :default => 0
      t.timestamps
    end
    add_index :documents_categories, :sort_index
  end
end
