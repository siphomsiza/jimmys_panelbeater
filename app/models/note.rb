class Note < ApplicationRecord
  belongs_to :user,
  class_name: "User",
  foreign_key: 'user_id'

  validates :title,:content,:color, :presence => true
end
