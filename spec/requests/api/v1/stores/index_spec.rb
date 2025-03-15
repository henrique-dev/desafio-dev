require 'swagger_helper'

RSpec.describe '/api/v1/stores', type: :request do
  let(:Authorization) { ENV['API_SECRET'] }

  before do
    create_list(:store, 20)
  end

  path '/api/v1/stores' do
    get 'Get an store list' do
      tags 'Stores'

      produces 'application/json'

      security [ApiKeyAuth: []]

      parameter name: :page, in: :query, type: :string, required: false

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            properties: {
              stores: {
                type: :array,
                items: {
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
              },
              meta: {
                current_page: { type: :integer },
                total_pages: { type: :integer },
                total_count: { type: :integer },
                per_page: { type: :integer }
              }
            }, required: %i[stores meta]
          )

          run_test! do |response|
            data = JSON.parse(response.body)

            expect(data['stores'].count).to eq(10)
          end
        end
      end
    end
  end
end
