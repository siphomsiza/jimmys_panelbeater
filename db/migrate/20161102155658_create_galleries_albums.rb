class CreateGalleriesAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table(:galleries_albums, id: :uuid, default: "uuid_generate_v4()") do |t|
      t.references :user, index: true
      t.string   :name
      t.text     :description
      t.boolean  :public_display
      t.timestamps
    end
  end
end
