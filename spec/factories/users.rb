FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {password}
    family_name           {'あああああ'}
    first_name           {'あああああ'}
    family_name_kana           {'アアアアア'}
    first_name_kana           {'アアアアア'}
    birthday           {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end


