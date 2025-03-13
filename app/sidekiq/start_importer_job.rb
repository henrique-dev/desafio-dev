class StartImporterJob
  include Sidekiq::Job

  def perform(importer_id)
    importer = Importer.find(importer_id)

    ImportMovementsFromFileService.call(importer:)
  end
end
