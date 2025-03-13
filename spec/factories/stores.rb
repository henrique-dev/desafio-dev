FactoryBot.define do
  factory :store, class: 'Store' do
    name { Faker::Company.unique.name }
    owner_name { Faker::Name.name }
  end
end
