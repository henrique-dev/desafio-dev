require 'rails_helper'

RSpec.describe "/importers", type: :request do
  let(:file) { fixture_file_upload('CNAB.txt') }
  let(:valid_attributes) { attributes_for(:importer, file:) }
  let(:invalid_attributes) { attributes_for(:importer, file: nil) }

  describe "GET /index" do
    it "renders a successful response" do
      create(:importer, **valid_attributes)
      get importers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      importer = create(:importer, **valid_attributes)
      get importer_url(importer)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_importer_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Importer" do
        expect {
          post importers_url, params: { importer: valid_attributes }
        }.to change(Importer, :count).by(1)
      end

      it "redirects to the created importer" do
        post importers_url, params: { importer: valid_attributes }
        expect(response).to redirect_to(importers_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Importer" do
        expect {
          post importers_url, params: { importer: invalid_attributes }
        }.to change(Importer, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post importers_url, params: { importer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
