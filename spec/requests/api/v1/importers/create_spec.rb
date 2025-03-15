require 'swagger_helper'

RSpec.describe '/api/v1/importers', type: :request do
  let(:importer) do
    {
      file: fixture_file_upload('CNAB.txt')
    }
  end
  let(:Authorization) { ENV['API_SECRET'] }

  path '/api/v1/importers' do
    post 'Create an importer' do
      tags 'Importers'

      consumes 'multipart/form-data'
      produces 'application/json'

      security [ApiKeyAuth: []]

      parameter name: :importer, in: :formData, schema: {
        type: :object, properties: { file: { type: :file } }
      }

      context 'with valid arguments' do
        response '201', 'created' do
          schema(
            type: :object,
            properties: {
              importer: {
                type: :object,
                properties: {
                  id: { type: :string },
                  created_at: { type: :string },
                  updated_at: { type: :string },
                  url: { type: :string }
                }, required: %i[id created_at updated_at url]
              }
            }, required: %i[importer]
          )

          run_test! do |response|
            data = JSON.parse(response.body)

            importer = Importer.find(data['importer']['id'])

            expect(importer.file.attached?).to eq(true)
          end
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
                  file: { type: :array, items: { type: :string }, example: ['must be filled'] }
                }, required: %i[]
              }
            }, required: %i[errors]
          )

          run_test!
        end

        response '401', 'unauthorized' do
          let(:Authorization) { nil }

          run_test!
        end
      end
    end
  end
end
