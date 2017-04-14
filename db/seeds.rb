# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create(email: "user@test.com",
                    password: "12345678",
                    password_confirmation: "12345678",
                    first_name: "John",
                    last_name: "Snow",
                    phone: "+584145607888")

AdminUser.create(email: "admin@admin.com",
                  password: "12345678",
                  password_confirmation: "12345678",
                  first_name: "Admin",
                  last_name: "Admin",
                  phone: "+584145607888")
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

100.times do |audit_log|
  AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end
puts "A 100 posts has been created"
