json.extract! user, :id, :unsername, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
