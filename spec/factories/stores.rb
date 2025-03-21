FactoryBot.define do
  factory :store, class: 'Store' do
    name { Faker::Company.unique.name }
    owner_name { Faker::Name.name }
    balance { Faker::Commerce.price }
  end
end
