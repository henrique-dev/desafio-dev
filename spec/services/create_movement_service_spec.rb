require 'rails_helper'

RSpec.describe CreateMovementService, type: :service do
  let(:store) { create(:store) }
  let(:params) { attributes_for(:movement, store_id: store.id) }

  subject do
    described_class.call(store:, params:)
  end

  shared_examples 'not create anything' do
    it 'not create a Movement' do
      expect do
        subject
      end.to change(Movement, :count).by(0)
    end
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject.errors).to eq({})
      expect(subject.success).to eq(true)
      expect(subject.object.kind).to eq(Movement.kinds.key(params[:kind]))
      expect(subject.object.occurred_on).to eq(params[:occurred_on])
      expect(subject.object.value).to eq(params[:value])
      expect(subject.object.personal_code).to eq(params[:personal_code])
      expect(subject.object.card_number).to eq(params[:card_number])
      expect(subject.object.occurred_at.strftime('%H:%M:%S')).to eq(params[:occurred_at].strftime('%H:%M:%S'))
      expect(subject.object.store_id).to eq(store.id)
    end

    it 'create a Movement' do
      expect do
        subject
      end.to change(Movement, :count).by(1)
    end
  end

  context 'with invalid arguments' do
    context 'when validating the contract' do
      context 'without kind' do
        let(:params) { attributes_for(:movement, store_id: store.id, kind: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ kind: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without occurred_on' do
        let(:params) { attributes_for(:movement, store_id: store.id, occurred_on: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ occurred_on: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without value' do
        let(:params) { attributes_for(:movement, store_id: store.id, value: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ value: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without personal_code' do
        let(:params) { attributes_for(:movement, store_id: store.id, personal_code: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ personal_code: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without card_number' do
        let(:params) { attributes_for(:movement, store_id: store.id, card_number: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ card_number: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without occurred_at' do
        let(:params) { attributes_for(:movement, store_id: store.id, occurred_at: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ occurred_at: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end
    end

    context 'with an invalid kind' do
      let(:params) { attributes_for(:movement, store_id: store.id, kind: Faker::Internet.unique.slug) }

      it 'is not valid' do
        expect(subject.errors).to eq({ kind: ['must be an integer'] })
        expect(subject.success).to eq(false)
      end

      it_behaves_like 'not create anything'
    end
  end
end
