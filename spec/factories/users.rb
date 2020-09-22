FactoryBot.define do
  factory :user do
    name { "user" }
    email { "user@gmail.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
    admin {false}
  end
  factory :admin_user, class: User do
    name { "admin" }
    email { "admin@gmail.com" }
    password { "000000" }
    password_confirmation{ "000000" }
    admin {true}
  end
end
