class CreateImporterService < BaseService
  def call(params:)
    contract = NewImporterContract.call(params.to_h)

    Importer.create!(state: :created).tap do |importer|
      attach_file_to_importer(importer, contract)

      StartImporterJob.perform_async(importer.id)
    end
  end

  private

  def attach_file_to_importer(importer, params)
    importer.file.attach(params[:file])
    importer.save
  end
end
