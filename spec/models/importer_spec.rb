require 'rails_helper'

RSpec.describe Importer, type: :model do
  let(:importer_params) { attributes_for(:importer) }

  subject do
    described_class.new(importer_params)
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject).to be_valid
    end

    it 'create an importer' do
      expect do
        subject.save!
      end.to change(Importer, :count).by(1)
    end

    it 'destroy an importer' do
      subject.save
      expect do
        subject.destroy!
      end.to change(Importer, :count).by(-1)
    end
  end
end
