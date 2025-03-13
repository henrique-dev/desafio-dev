class NewImporterContract < BaseContract
  params do
    required(:file).filled(type?: ActionDispatch::Http::UploadedFile)
  end
end
