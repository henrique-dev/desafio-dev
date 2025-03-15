require 'swagger_helper'

RSpec.describe '/api/v1/stores/{store_id}/movements/{id}', type: :request do
  let(:store) { create(:store) }
  let(:id) { create(:movement, store:).id }
  let(:Authorization) { ENV['API_SECRET'] }

  path '/api/v1/stores/{store_id}/movements/{id}' do
    get 'Get an movement' do
      tags 'Movements'

      produces 'application/json'

      security [ApiKeyAuth: []]

      parameter name: :store_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            properties: {
              id: { type: :string },
              kind: { type: :string },
              occurred_on: { type: :string },
              value: { type: :string },
              personal_code: { type: :string },
              card_number: { type: :string },
              occurred_at: { type: :string },
              store_id: { type: :string },
              created_at: { type: :string },
              updated_at: { type: :string },
              url: { type: :string }
            }, required: %i[id kind occurred_on value personal_code card_number occurred_at
                            store_id created_at updated_at url]
          )

          let(:store_id) { store.id }
          run_test!
        end
      end

      context 'with invalid arguments' do
        response '404', 'not found' do
          let(:store_id) { store.id }
          let(:id) { SecureRandom.uuid }

          run_test!
        end

        response '401', 'unauthorized' do
          let(:store_id) { store.id }
          let(:Authorization) { nil }

          run_test!
        end
      end
    end
  end
end
