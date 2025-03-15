require 'rails_helper'

RSpec.describe CreateUserService, type: :service do
  let(:user_params) { attributes_for(:user) }
  let(:params) do
    user_params.merge({ info: { name: user_params[:name], email: user_params[:email] } })
  end

  subject do
    described_class.call(params:)
  end

  shared_examples 'not create anything' do
    it 'not create a User' do
      expect do
        subject
      end.to change(User, :count).by(0)
    end
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject.errors).to eq({})
      expect(subject.success).to eq(true)
    end

    it 'create a User' do
      expect do
        subject
      end.to change(User, :count).by(1)
    end
  end

  context 'with invalid arguments' do
    context 'when validating the contract' do
      context 'without provider' do
        let(:user_params) { attributes_for(:user, provider: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ provider: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without uid' do
        let(:user_params) { attributes_for(:user, uid: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ uid: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without name' do
        let(:user_params) { attributes_for(:user, name: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ info: { name: ['must be filled'] } })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end

      context 'without email' do
        let(:user_params) { attributes_for(:user, email: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ info: { email: ['must be filled'] } })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything'
      end
    end
  end
end
