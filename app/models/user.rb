# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  firstname              :string(255)      default(""), not null
#  lastname               :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  provider               :string(255)
#  uid                    :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  data                   :json             default({})
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_users_on_email                 (email) UNIQUE
#  index_users_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ActiveRecord::Base
  default_scope  -> {order("created_at asc")}
  has_many :notes,
           :class_name => "Note",
           :foreign_key => "user_id",
           :dependent => :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :timeoutable

  # validates :email,
  # :presence => true,
  # :uniqueness => true,
  # :email => true
  def to_s
    [firstname, lastname].join(" ").presence || email
  end

  def fullname
    [firstname, lastname].join(" ").presence || email
  end
  alias_method :name, :fullname

  def system_admin?
    return system_admin == true
  end

  def system_user?
    return system_admin == false
  end

end
