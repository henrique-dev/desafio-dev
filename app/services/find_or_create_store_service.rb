class FindOrCreateStoreService < BaseService
  def call(params:)
    contract = NewStoreContract.call(params.to_h)

    store = Store.find_by(name: contract[:name])

    return store if store.present?

    Store.create!(contract)
  end
end
