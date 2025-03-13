require 'rails_helper'

RSpec.describe Movement, type: :model do
  let(:store) { create(:store) }
  let(:movement_params) { attributes_for(:movement, store_id: store.id) }

  subject do
    described_class.new(movement_params)
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject).to be_valid
    end

    it 'create a movement' do
      expect do
        subject.save!
      end.to change(Movement, :count).by(1)
    end

    it 'destroy a movement' do
      subject.save
      expect do
        subject.destroy!
      end.to change(Movement, :count).by(-1)
    end
  end

  context 'with invalid arguments' do
    it 'without kind is not a valid object' do
      movement_params.delete(:kind)
      expect(subject).to_not be_valid
    end

    it 'without occurred_on is not a valid object' do
      movement_params.delete(:occurred_on)
      expect(subject).to_not be_valid
    end

    it 'without value is not a valid object' do
      movement_params.delete(:value)
      expect(subject).to_not be_valid
    end

    it 'without personal_code is not a valid object' do
      movement_params.delete(:personal_code)
      expect(subject).to_not be_valid
    end

    it 'without card_number is not a valid object' do
      movement_params.delete(:card_number)
      expect(subject).to_not be_valid
    end

    it 'without occurred_at is not a valid object' do
      movement_params.delete(:occurred_at)
      expect(subject).to_not be_valid
    end

    it 'without store_id is not a valid object' do
      movement_params.delete(:store_id)
      expect(subject).to_not be_valid
    end
  end
end
