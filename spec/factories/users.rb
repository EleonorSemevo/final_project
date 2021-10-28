FactoryBot.define do
  factory :user do
    name { 'loren' }
    email { 'loren@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}

  end
end
