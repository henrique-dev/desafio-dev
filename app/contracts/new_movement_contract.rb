class NewMovementContract < BaseContract
  params do
    required(:kind).filled(included_in?: Movement.kinds.keys)
    required(:occurred_on).filled(:date)
    required(:value).filled(:decimal)
    required(:personal_code).filled(:string)
    required(:card_number).filled(:string)
    required(:occurred_at).filled(:time)
  end
end
