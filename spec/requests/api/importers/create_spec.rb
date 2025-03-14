require 'swagger_helper'

RSpec.describe "/importers", type: :request do
  let(:importer) do
    {
      file: fixture_file_upload('CNAB.txt')
    }
  end

  path '/importers' do
    post 'Create an importer' do
      tags 'Importers'

      consumes 'multipart/form-data'
      produces 'application/json'

      parameter name: :importer, in: :formData, schema: {
        type: :object, properties: { file: { type: :file } }
      }

      context 'with valid arguments' do
        response '201', 'created' do
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
        response '422', 'unprocessable content' do
          let(:importer) do
            {
              file: nil
            }
          end

          schema(
            type: :object,
            properties: {
              errors: {
                type: :object,
                properties: {
                  file: { type: :array, items: { type: :string }, example: [ 'must be filled' ] }
                }, required: %i[]
              }
            }, required: %i[errors]
          )

          run_test!
        end
      end
    end
  end
end
