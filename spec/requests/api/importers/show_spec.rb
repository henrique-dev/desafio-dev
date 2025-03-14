require 'swagger_helper'

RSpec.describe "/importers/{id}", type: :request do
  let(:id) { create(:importer).id }

  path '/importers/{id}' do
    get 'Get an importer' do
      tags 'Importers'

      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      context 'with valid arguments' do
        response '200', 'ok' do
          schema(
            type: :object,
            properties: {
              id: { type: :string },
              created_at: { type: :string },
              updated_at: { type: :string },
              url: { type: :string }
            }, required: %i[id created_at updated_at url]
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
