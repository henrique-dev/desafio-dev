require 'rails_helper'

RSpec.describe StartImporterJob, type: :job do
  let(:importer) { create(:importer, :with_file) }

  subject do
    described_class.perform_async(importer.id)
  end

  it 'perform an async job' do
    expect do
      subject
    end.to change(described_class.jobs, :size).by(1)
  end

  it 'perform a job without error' do
    expect(ImportMovementsFromFileService).to receive(:call).and_call_original
    expect do
      described_class.new.perform(importer.id)
    end.to_not raise_error
  end
end
