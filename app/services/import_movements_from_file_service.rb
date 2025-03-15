class ImportMovementsFromFileService < BaseService
  def call(importer:)
    importer.file.open do |io|
      io.set_encoding('UTF-8')

      io.each_line do |line|
        params = extract_params_from_line(line)

        store = create_store(params)

        create_movement(store, params) if store.present?
      end
    end

    importer.update(state: :success)

    importer
  end

  private

  def extract_params_from_line(line)
    {
      kind: line[0, 1], occurred_on: line[1, 8], value: line[9, 10],
      personal_code: line[19, 11], card_number: line[30, 12],
      occurred_at: transform_time(line[42, 6]), owner_name: line[48, 14], name: line[62, 18].strip
    }
  end

  def create_store(params)
    response = FindOrCreateStoreService.call(params:)

    response.object
  end

  def create_movement(store, params)
    CreateMovementService.call(store:, params:)
  end

  def transform_time(denormalized_time)
    "#{denormalized_time[0, 2]}:#{denormalized_time[2, 2]}:#{denormalized_time[4, 2]}"
  end
end
