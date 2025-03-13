require 'rails_helper'

RSpec.describe ImportMovementsFromFileService, type: :service do
  let(:file) do
    ActionDispatch::Http::UploadedFile.new({
      filename: Faker::File.file_name(ext: 'txt', dir: '', directory_separator: ''),
      type: 'text/plain',
      tempfile: fixture_file_upload('CNAB.txt')
    })
  end
  let(:importer) { create(:importer, :with_file) }

  subject do
    described_class.call(importer:)
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
      expect(subject.object.state).to eq('success')


      store_1 = Store.find_by(name: 'BAR DO JOÃO')
      expect(store_1.balance).to eq(0.406e5)

      store_2 = Store.find_by(name: 'LOJA DO Ó - MATRIZ')
      expect(store_2.balance).to eq(0.434e5)

      store_3 = Store.find_by(name: 'MERCADO DA AVENIDA')
      expect(store_3.balance).to eq(0.23352e6)

      store_4 = Store.find_by(name: 'MERCEARIA 3 IRMÃOS')
      expect(store_4.balance).to eq(0.7023e6)

      store_5 = Store.find_by(name: 'LOJA DO Ó - FILIAL')
      expect(store_5.balance).to eq(0.15232e5)
    end

    it 'create a Store' do
      expect do
        subject
      end.to change(Store, :count).by(5).and change(Movement, :count).by(21)
    end
  end
end
