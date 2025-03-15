FactoryBot.define do
  factory :movement, class: 'Movement' do
    kind { Movement.kinds.values.sample }
    occurred_on { Faker::Date.between(from: '2024-01-01', to: '2026-12-30') }
    value { Faker::Commerce.price }
    personal_code { Faker::Internet.unique.slug }
    card_number { Faker::Finance.credit_card }
    occurred_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    association :store, factory: :store
  end
end
