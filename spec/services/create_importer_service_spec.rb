require 'rails_helper'

RSpec.describe CreateImporterService, type: :service do
  let(:file) do
    ActionDispatch::Http::UploadedFile.new({
                                             filename: Faker::File.file_name(ext: 'txt', dir: '',
                                                                             directory_separator: ''),
                                             type: 'text/plain',
                                             tempfile: fixture_file_upload('CNAB.txt')
                                           })
  end
  let(:params) { attributes_for(:importer, file:) }

  subject do
    described_class.call(params:)
  end

  shared_examples 'not create anything and not call anything' do
    it 'not create a Importer' do
      expect do
        subject
      end.to change(Importer, :count).by(0)
    end

    it 'not call StartImporterJob' do
      expect do
        subject
      end.to change(StartImporterJob.jobs, :size).by(0)
    end
  end

  context 'with valid arguments' do
    it 'is a valid object' do
      expect(subject.errors).to eq({})
      expect(subject.success).to eq(true)
      expect(subject.object.state).to eq('created')
      expect(subject.object.file.attached?).to eq(true)
    end

    it 'create a Importer' do
      expect do
        subject
      end.to change(Importer, :count).by(1)
    end

    it 'call StartImporterJob' do
      expect do
        subject
      end.to change(StartImporterJob.jobs, :size).by(1)
    end
  end

  context 'with invalid arguments' do
    context 'when validating the contract' do
      context 'without file' do
        let(:params) { attributes_for(:store, file: nil) }

        it 'is not valid' do
          expect(subject.errors).to eq({ file: ['must be filled'] })
          expect(subject.success).to eq(false)
        end

        it_behaves_like 'not create anything and not call anything'
      end
    end
  end
end
