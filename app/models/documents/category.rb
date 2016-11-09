# == Schema Information
#
# Table name: documents_categories
#
#  id                        :integer          not null, primary key
#  name                      :string(255)
#  parent_id                 :integer
#  colour                    :string(255)
#  sort_index                :integer
#  created_at                :datetime
#  updated_at                :datetime
#  user_id                   :integer
#  children_categories_count :integer          default(0), not null
#  documents_count           :integer          default(0), not null
#
# Indexes
#
#  index_documents_categories_on_account_id   (account_id)
#  index_documents_categories_on_branch_id    (branch_id)
#  index_documents_categories_on_division_id  (division_id)
#  index_documents_categories_on_parent_id    (parent_id)
#  index_documents_categories_on_sort_index   (sort_index)
#

module Documents
  class Category < ActiveRecord::Base
    THEME_COLORS = {

       "White" => "bg-white",
       "Silver"=> "bg-silver",

       "Black"=> "bg-black",
       "Dark black"=> "bg-black-darker",
       "lighter black"=> "bg-black-lighter",

       "Grey"=> "bg-grey",
       "Dark grey"=> "bg-grey-darker",
       "Lighter grey"=> "bg-grey-lighter",
       "Darker red"=> "bg-red-darker",

       "Red" =>"bg-red",
       "Lighter red"=> "bg-red-lighter ",

       "Orage" => "bg-orange ",
       "Darker orange" => "bg-orange-darker",
       "Lighter orange"=> "bg-orange-lighter",

       "Yellow" => "bg-yellow",
       "Darker " => "bg-yellow-darker",
       "Lighter yellow"=> "bg-yellow-lighter",

       "Green" => "bg-green",
       "Darker green"=> "bg-green-darker",
       "Lighter green"=> "bg-green-lighter",

       "Blue" => "bg-blue",
       "Darker blue"=> "bg-blue-darker",
       "Lighter blue"=> "bg-blue-lighter",

       "Aqua"=> "bg-aqua",
       "Darker aqua" => "bg-aqua-darker",
       "Lighter aqua"=> "bg-aqua-lighter",

       "Purple"=> "bg-purple",
       "Darker purple" => "bg-purple-darker",
       "Lighter purple"=> "bg-purple-lighter"
    }

    belongs_to :user,
    :class_name => "User",
    :foreign_key => "user_id"

    belongs_to :parent_category,
               :class_name => "Documents::Category",
               :foreign_key => "parent_id"

    has_many :children_categories,
             :class_name => "Documents::Category",
             :foreign_key => "parent_id",
             :dependent => :destroy

    has_many :documents,
             :class_name => "Documents::Document",
             :foreign_key => "category_id",
             :dependent => :destroy
    validates :name, :presence => true
    validates :user_id, :presence => true

    def to_s
      name
    end

    after_initialize do |obj|
      obj[:colour] ||= THEME_COLORS['Blue']
    end

    before_validation :update_document_counts
    after_commit :update_parent_document_counts, on: [:create, :update, :destroy]

    private

    def update_document_counts
      self[:children_categories_count] = children_categories.count
      self[:documents_count] = children_categories.map(&:documents_count).sum + documents.count
      true
    end

    def update_parent_document_counts
      parent_category.try(:save)
      true
    end
  end
end
