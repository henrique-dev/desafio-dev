class CreateUserService < BaseService
  def call(params:)
    contract = NewUserContract.call(params)

    User.find_or_create_by(provider: contract[:provider], uid: contract[:uid]) do |user|
      user.name = contract[:info][:name]
      user.email = contract[:info][:email]
    end
  end
end
