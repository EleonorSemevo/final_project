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
  
  factory :user5, class: User do
    name { 'lalala' }
    email { 'lalala@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end
  factory :user6, class: User do
    name { 'lololo' }
    email { 'lololo@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end
  factory :user7, class: User do
    name { 'lilili' }
    email { 'lilili@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end
  factory :user8, class: User do
    name { 'nanana' }
    email { 'nanana@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end
  factory :user9, class: User do
    name { 'rerere' }
    email { 'rerere@gmail.com' }
    password { 'password' }
    admin { false }
    password_confirmation {'password'}
  end
  factory :user10, class: User do
    name { 'azer' }
    email { 'azer@gmail.com' }
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
