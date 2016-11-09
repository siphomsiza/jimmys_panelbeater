module Documents::CategoriesHelper
  def tree_breadcrumbs(item)
    roots = []

    roots << " <i class='fa fa-chevron-right'></i> " + link_to(item, documents_category_path(item), class: '') unless item.new_record?
    roots << " <i class='fa fa-chevron-right'></i> New" if item.new_record?
    parent = item.parent_category

    while parent.present?

      roots << " <i class='fa fa-chevron-right'></i> " +  link_to(parent, documents_category_path(parent), class: '')
      parent = parent.parent_category
    end
    roots << link_to("Categories" ,documents_categories_path())
    return roots.reverse!
  end
end
