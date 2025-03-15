require 'swagger_helper'

RSpec.describe "/api/v1/stores/{store_id}/movements", type: :request do
  let(:store) { create(:store) }
  let(:Authorization) { ENV['API_SECRET'] }

  before do
    create_list(:movement, 20, store:)
  end

  path '/api/v1/stores/{store_id}/movements' do
    get 'Get an movement list' do
      tags 'Movements'

      produces 'application/json'

      security [ ApiKeyAuth: [] ]

      parameter name: :store_id, in: :path, type: :string
      parameter name: :page, in: :query, type: :string, required: false

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            properties: {
              movements: {
                type: :array,
                items: {
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
                }
              },
              meta: {
                current_page: { type: :integer },
                total_pages: { type: :integer },
                total_count: { type: :integer },
                per_page: { type: :integer }
              }
            }, required: %i[movements meta]
          )

          let(:store_id) { store.id }
          run_test! do |response|
            data = JSON.parse(response.body)

            expect(data['movements'].count).to eq(10)
          end
        end
      end
    end
  end
end
