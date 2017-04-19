# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create!(email: "user@test.com",
                    password: "12345678",
                    password_confirmation: "12345678",
                    first_name: "John",
                    last_name: "Snow",
                    phone: "584145607888")

AdminUser.create!(email: "admin@admin.com",
                  password: "12345678",
                  password_confirmation: "12345678",
                  first_name: "Admin",
                  last_name: "Admin",
                  phone: "584145607888")
AuditLog.create!(user_id: @user.id, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user.id, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user.id, start_date: (Date.today - 20.days))

100.times do |post|
  Post.create!(date: Date.today, rationale: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: @user.id, overtime_request: 2.5)
end


puts "A 100 posts has been created"
