FactoryBot.define do
  factory :user do
    name { 'loren' }
    email { 'loren@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}

  end

  factory :user2, class: User do
    name { 'Lary' }
    email { 'grace@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end

  factory :user3, class: User do
    name { 'Larra' }
    email { 'larra@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end

  factory :user4, class: User do
    name { 'Larram' }
    email { 'larram@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end

  factory :admin, class: User do
    name { 'Lary' }
    email { 'admin@gmail.com' }
    password { 'password' }
    admin { true }
    password_confirmation {'password'}
  end
end
