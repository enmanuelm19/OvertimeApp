FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name "John"
    last_name "Snow"
    email { generate :email }
    password "12345678"
    password_confirmation "12345678"
    phone "584145607888"
  end

  factory :admin, class: "AdminUser" do
    first_name "Admin"
    last_name "Admin"
    email "admin@test.com"
    password "12345678"
    password_confirmation "12345678"
    phone "584145607888"
  end

  factory :non_authorized_user, class: "User" do
    first_name "NonAuthorize"
    last_name "Nop"
    email { generate :email }
    password "12345678"
    password_confirmation "12345678"
    phone "584145607888"
  end
end
