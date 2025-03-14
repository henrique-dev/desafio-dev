require 'swagger_helper'

RSpec.describe "/stores", type: :request do
  before do
    create_list(:store, 20)
  end

  path '/stores' do
    get 'Get an store list' do
      tags 'Stores'

      produces 'application/json'

      parameter name: :page, in: :query, type: :string, required: false

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            propeerties: {
              stores: {
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
