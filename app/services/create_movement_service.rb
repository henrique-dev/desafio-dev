class CreateMovementService < BaseService
  def call(store:, params:)
    contract = NewMovementContract.call(params.to_h)

    store.movements.create!(contract)
  end
end
