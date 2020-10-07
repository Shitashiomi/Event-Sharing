json.extract! event, :id, :title, :description, :start_date, :end_date, :created_at, :updated_at, :image, :user_id
json.url event_url(event, format: :json)
