# This migration comes from core (originally 20150213094801)
class EnableUuidExtension < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
  end
end
