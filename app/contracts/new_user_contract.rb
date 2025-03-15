class NewUserContract < BaseContract
  params do
    required(:provider).filled(:string)
    required(:uid).filled(:string)
    required(:info).hash do
      required(:name).filled(:string)
      required(:email).filled(:string)
    end
  end
end
