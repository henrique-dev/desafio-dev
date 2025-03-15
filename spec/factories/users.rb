FactoryBot.define do
  factory :user, class: 'User' do
    provider { 'google_oauth2' }
    uid { Faker::Internet.unique.slug }
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
