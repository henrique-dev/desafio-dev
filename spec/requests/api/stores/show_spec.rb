require 'swagger_helper'

RSpec.describe "/stores/{id}", type: :request do
  let(:id) { create(:store).id }

  path '/stores/{id}' do
    get 'Get an store' do
      tags 'Stores'

      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            properties: {
              store: {
                type: :object,
                properties: {
                  id: { type: :string },
                  name: { type: :string },
                  owner_name: { type: :string },
                  balance: { type: :string },
                  created_at: { type: :string },
                  updated_at: { type: :string },
                  url: { type: :string }
                }, required: %i[id name owner_name balance created_at updated_at url]
              }
            }, required: %i[store]
          )

          run_test!
        end
      end

      context 'with invalid arguments' do
        response '404', 'not found' do
          let(:id) { SecureRandom.uuid }

          run_test!
        end
      end
    end
  end
end
