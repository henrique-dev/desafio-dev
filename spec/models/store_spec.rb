require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store_params) { attributes_for(:store) }

  subject do
    described_class.new(store_params)
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject).to be_valid
    end

    it 'create a store' do
      expect do
        subject.save!
      end.to change(Store, :count).by(1)
    end

    it 'destroy a store' do
      subject.save
      expect do
        subject.destroy!
      end.to change(Store, :count).by(-1)
    end
  end

  context 'with invalid arguments' do
    it 'without name is not a valid object' do
      store_params.delete(:name)
      expect(subject).to_not be_valid
    end

    it 'without owner_name is not a valid object' do
      store_params.delete(:owner_name)
      expect(subject).to_not be_valid
    end
  end
end
