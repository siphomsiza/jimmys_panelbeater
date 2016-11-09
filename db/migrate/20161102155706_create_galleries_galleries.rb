class CreateGalleriesGalleries < ActiveRecord::Migration
  def change
    create_table(:galleries_galleries, id: :uuid, default: "uuid_generate_v4()") do |t|
      t.references :user, index: true
      t.references :album, index: true
      t.string   :caption
      t.string   :file
      t.jsonb    :data ,default: {}
      t.integer  :position
      t.integer  :seq,             default: 0
      t.boolean  :name_processing, default: false, null: false
      t.string   :name_tmp
      t.timestamps
    end
  end
end
