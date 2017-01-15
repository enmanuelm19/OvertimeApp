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
  end

  factory :admin, class: "AdminUser" do
    first_name "Admin"
    last_name "Admin"
    email "test2@test.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
