require 'rails_helper'

RSpec.describe FindOrCreateStoreService, type: :service do
  let(:name) { Faker::Company.unique.name }
  let(:params) { attributes_for(:store, name:) }

  subject do
    described_class.call(params:)
  end

  shared_examples 'not create anything' do
    it 'not create a Store' do
      expect do
        subject
      end.to change(Store, :count).by(0)
    end
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject.errors).to eq({})
      expect(subject.success).to eq(true)
      expect(subject.object.name).to eq(params[:name])
      expect(subject.object.owner_name).to eq(params[:owner_name])
    end

    it 'create a Store' do
      expect do
        subject
      end.to change(Store, :count).by(1)
    end

    context 'when already have a store with same name' do
      let!(:store) { create(:store, name:) }

      it 'is a valid object' do
        expect(subject.errors).to eq({})
        expect(subject.success).to eq(true)
        expect(subject.object).to eq(store)
      end

      it_behaves_like 'not create anything'
    end
  end

  context 'with invalid arguments' do
    context 'when validating the contract' do
      context 'without name' do
        let(:params) { attributes_for(:store, name: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ name: [ "must be filled" ] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without owner_name' do
        let(:params) { attributes_for(:store, owner_name: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ owner_name: [ "must be filled" ] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end
    end
  end
end
