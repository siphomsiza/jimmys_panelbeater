class Galleries::Gallery < ApplicationRecord
  include ActiveModel::AttributeAssignment
  attr_accessor :url_saved, :url, :size, :is_image, :thumbnail_url, :content_type, :delete_url, :delete_type

  mount_uploader :file, GallaryUploader

  belongs_to :user,
  :class_name => "User",
  :foreign_key => "user_id"

  belongs_to :album,
  :class_name => "Galleries::Album",
  :foreign_key => "album"

  validates :file, :presence => true
  validates :user_id, :presence => true

  def to_s
    file
  end

  def to_jq_upload
      self.file = file.try(:filename)
      is_img = file.try(:content_type) =~ /image/ ? true : false
      {"name" =>  file.try(:filename),
       "is_image" => is_img,
       "size" => file.try(:size),
       "url" =>  file.try(:url),
       "thumbnail_url" =>is_img ? file.try(:url) :  nil,
       "content_type" => file.try(:content_type),
       "delete_url" => "/galleries/albums/#{self.album_id}/galleries/#{self.id}",
       "delete_type" => "DELETE"
      }
  end



end
