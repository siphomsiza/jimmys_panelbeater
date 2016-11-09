# == Schema Information
#
# Table name: documents_documents
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  file        :text
#  category_id :integer
#  sort_index  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  data        :text
#  user_id     :integer
#
# Indexes
#
#  index_documents_documents_on_category_id  (category_id)
#  index_documents_documents_on_sort_index   (sort_index)
#

module Documents
  class Document < ActiveRecord::Base

    #include HasAttribute
    # fields_storage_attribute :data
    # has_attributes :url_saved, :url, :size, :is_image, :thumbnail_url, :content_type, :delete_url, :delete_type

    include ActiveModel::AttributeAssignment
    attr_accessor :url_saved, :url, :size, :is_image, :thumbnail_url, :content_type, :delete_url, :delete_type

    mount_uploader :file, DocumentUploader

    belongs_to  :category,
                :class_name => "Documents::Category",
                :foreign_key => "category_id"
    belongs_to :user,
               :class_name => "User",
               :foreign_key => "user_id"


    validates :file,:category_id, :presence => true
    def to_jq_upload
        self.name = file.try(:filename)
        is_img = file.try(:content_type) =~ /image/ ? true : false
        {"name" =>  file.try(:filename),
         "is_image" => is_img,
         "size" => file.try(:size),
         "url" =>  file.try(:url),
         "thumbnail_url" =>is_img ? file.try(:url) :  nil,
         "content_type" => file.try(:content_type),
         "delete_url" => "/documents/categories/#{self.category.id}/documents/#{self.id}",
         "delete_type" => "DELETE"
        }
    end

    def image?
      is_image
    end

    def to_s
      name
    end

    after_save :save_meta_data
    after_commit :update_parent_document_counts, on: [:create, :update, :destroy]

    private

    def update_parent_document_counts
      category.try(:save)
    end

    def save_meta_data
      d = to_jq_upload
      d.each_pair do |k,v|
        self.send("#{k}=", v)
      end
      # binding.pry
      self.data[:name] = d["name"]
      if !url_saved && url.to_s =~ /amazon/
        self.url_saved = true
        self.save!
      end
    end
  end

end
