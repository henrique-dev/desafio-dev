require 'swagger_helper'

RSpec.describe '/api/v1/importers', type: :request do
  let(:Authorization) { ENV['API_SECRET'] }

  before do
    create_list(:importer, 20)
  end

  path '/api/v1/importers' do
    get 'Get an importer list' do
      tags 'Importers'

      produces 'application/json'

      security [ApiKeyAuth: []]

      parameter name: :page, in: :query, type: :string, required: false

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            properties: {
              importers: {
                type: :array,
                items: {
                  properties: {
                    id: { type: :string },
                    created_at: { type: :string },
                    updated_at: { type: :string },
                    url: { type: :string }
                  }, required: %i[id created_at updated_at url]
                }
              },
              meta: {
                current_page: { type: :integer },
                total_pages: { type: :integer },
                total_count: { type: :integer },
                per_page: { type: :integer }
              }
            }, required: %i[importers meta]
          )

          run_test! do |response|
            data = JSON.parse(response.body)

            expect(data['importers'].count).to eq(10)
          end
        end
      end
    end
  end
end
