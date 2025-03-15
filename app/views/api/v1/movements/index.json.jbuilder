json.movements do
  json.partial! "movements/movement", collection: @movements, as: :movement, store: @store
end

json.meta do
  json.current_page @movements.current_page
  json.total_pages @movements.total_pages
  json.total_count @movements.total_count
  json.per_page @movements.limit_value
end
