class NewStoreContract < BaseContract
  params do
    required(:name).filled(:string)
    required(:owner_name).filled(:string)
  end
end
