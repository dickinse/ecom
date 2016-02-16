FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  # sequence(:first_name) { |a| "User" + a.chr }

  factory :user do
    email
    password "87654321"
    first_name "Jamila"
    last_name "Doe"
    admin false
  end

  factory :admin, class: User do
    email
    password "qwertyui"
    admin true
    first_name "Obi"
    last_name "Juan"
  end
end
