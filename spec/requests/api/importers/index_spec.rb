require 'swagger_helper'

RSpec.describe "/importers", type: :request do
  before do
    create_list(:importer, 20)
  end

  path '/importers' do
    get 'Get an importer list' do
      tags 'Importers'

      produces 'application/json'

      parameter name: :page, in: :query, type: :string, required: false

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :array,
            items: {
              type: :object,
              properties: {
                id: { type: :string },
                created_at: { type: :string },
                updated_at: { type: :string },
                url: { type: :string }
              }, required: %i[id created_at updated_at url]
            }
          )

          run_test! do |response|
            data = JSON.parse(response.body)

            expect(data.count).to eq(10)
          end
        end
      end
    end
  end
end
