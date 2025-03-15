json.stores do
  json.partial! 'stores/store', collection: @stores, as: :store
end

json.meta do
  json.current_page @stores.current_page
  json.total_pages @stores.total_pages
  json.total_count @stores.total_count
  json.per_page @stores.limit_value
end
