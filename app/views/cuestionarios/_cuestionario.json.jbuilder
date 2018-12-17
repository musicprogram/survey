json.extract! cuestionario, :id, :user_id, :created_at, :updated_at
json.url cuestionario_url(cuestionario, format: :json)