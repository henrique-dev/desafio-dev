json.extract! movement, :id, :kind, :occurred_on, :value, :personal_code, :card_number, :occurred_at, :store_id,
              :created_at, :updated_at

json.url store_movement_url(store, movement, format: :json)
