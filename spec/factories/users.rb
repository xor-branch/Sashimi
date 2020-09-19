FactoryBot.define do
  factory :user do
    name { "user" }
    email { "user@gamil.com" }
    password{ "000000" }
    password_confirmation{ "000000" }
    admin {false}
  end
  factory :admin_user, class: User do
    name { "admin" }
    email { "admin@gamil.com" }
    password { "000000" }
    password_confirmation{ "000000" }
    admin {true}
  end
end
