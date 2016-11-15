class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes , id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :user
      t.string   "title"
      t.text     "content"
      t.string   "color"
      t.boolean  "private",default: false, null: false
      t.string   "pos_x",      :default => "0px"
      t.string   "pos_y",      :default => "47px"
      t.integer  "z_index",    :default => 0
      t.timestamps
    end
  end
end
