# This migration comes from core (originally 20150213094701)
class EnableCitextExtension < ActiveRecord::Migration
  def change
    enable_extension 'citext'
  end
end
