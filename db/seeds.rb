# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'load super admin'
@admin = User.new(:last_name => 'admin', :first_name => 'admin', :login => 'admin', :password => 'admin', :password_confirmation => 'admin', :email => 'admin@vi.com')
@admin.save(:validate => false)


puts 'load user roles'
@admin_role = Role.create(:role_type => "SuperAdmin")
@admin.role = @admin_role
Role.create(:role_type => "Manager")
Role.create(:role_type => "Customer")
