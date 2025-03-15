json.importers do
  json.partial! "importers/importer", collection: @importers, as: :importer
end

json.meta do
  json.current_page @importers.current_page
  json.total_pages @importers.total_pages
  json.total_count @importers.total_count
  json.per_page @importers.limit_value
end
