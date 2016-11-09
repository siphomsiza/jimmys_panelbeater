class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :determine_layout
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def determine_layout
    return 'application-devise' if devise_controller?
    request.xhr? ? false : 'application'
  end


  helper_method :section,
  :section_name,
  :sub_section,
  :sub_section_name,
  :sub_sub_section,
  :sub_sub_section_name,
  :section_display_name,
  :sub_section_display_name,
  :sub_sub_section_display_name,
  :has_custom_breadcrumbs?,
  :breadcrumb_header,
  :section_url,
  :sub_section_url,
  :sub_sub_section_url


  def section
  end

  def sub_section
  end

  def sub_sub_section
  end

  def section_name
  end

  def sub_section_name
  end

  def sub_sub_section_name
  end

  def section_display_name
    return controller_name.humanize.titleize if ["sessions","unlocks","passwords","confirmations","registrations"].include?(controller_name)
    section_name.to_s.humanize.capitalize
  end

  def sub_section_display_name
    return false if ["sessions","unlocks","passwords","confirmations","registrations"].include?(controller_name)
    sub_section_name.to_s.humanize.titleize
  end

  def sub_sub_section_display_name
    sub_sub_section_name.to_s.humanize.titleize
  end


  def section_url
  end

  def sub_section_url
  end

  def sub_sub_section_url
  end

  def sidebar_level
    :sub_sub_section
  end

  def breadcrumb_header
    # return sub_sub_section_display_name if sub_sub_section_display_name.present?
    # return sub_section_display_name if sub_section_display_name.present?
    # section_display_name
    controller_name.to_s.humanize.capitalize
  end

  def has_custom_breadcrumbs?
    false
  end

  def pjax_layout
    'pjax'
  end


  protected

  # overrides the devise path for signed out user to root
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_url
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :remember_me) }
    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end
end
