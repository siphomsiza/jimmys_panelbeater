class Galleries::Album < ApplicationRecord
  belongs_to :user,
  :class_name => "User",
  :foreign_key => "user_id"

  has_many :galleries,
           :class_name => "Galleries::Gallery",
           :foreign_key => "album_id",
           :dependent => :destroy
   validates :name, :presence => true
   validates :user_id, :presence => true

   def to_s
     name
   end

end
