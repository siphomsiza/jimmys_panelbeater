class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @page_name = "Dashboard"
  end

  private

  def section_name
    'Dashboard'
  end

  def section
    'Dashboard'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end
end
