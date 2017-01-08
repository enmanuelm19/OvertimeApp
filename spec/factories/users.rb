FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    email "test@test.com"
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
