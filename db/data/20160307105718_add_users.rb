class AddUsers < SeedMigration::Migration
  def up
    User.delete_all
    # Create System Admin
    object = User.new(Settings.SYSTEM_ADMIN_DATA.to_hash)
    object.password_confirmation = Settings.SYSTEM_ADMIN_DATA.password
    object.skip_confirmation!
    object.system_admin = true

    object.save!
    puts ['id', 'firstname', 'lastname', 'email', 'password'].map{|x| {x => object.send(x)}}
    puts "Is System Admin? => #{object.system_admin?}"
    puts "\n\n"

    # Create System User
    object = User.new(Settings.NORMAL_USER_DATA.to_hash)
    object.password_confirmation = Settings.NORMAL_USER_DATA.password
    object.skip_confirmation!
    object.save!
    puts ['id', 'firstname', 'lastname', 'email', 'password'].map{|x| {x => object.send(x)}}
    puts "Is System User? => #{object.system_user?}"
  end

  def down
    User.delete_all
  end
end
