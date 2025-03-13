class ImportMovementsFromFileService < BaseService
  def call(importer:)
    importer.file.open do |io|
      io.set_encoding("UTF-8")

      io.each_line do |line|
        kind = line[0, 1]
        occurred_on = line[1, 8]
        value = line[9, 10]
        personal_code = line[19, 11]
        card_number = line[30, 12]
        occurred_at = line[42, 6]
        owner_name = line[48, 14]
        name = line[62, 18].strip

        store = create_store({ name:, owner_name: })

        next if store.nil?

        create_movement(store, {
          kind:, occurred_on:, value:, personal_code:, card_number:,
          occurred_at: transform_time(occurred_at)
        })
      end
    end

    importer.update(state: :success)

    importer
  end

  private

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
