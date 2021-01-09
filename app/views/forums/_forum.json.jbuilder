json.extract! forum, :id, :name, :description, :user_id, :created_at, :updated_at
json.url forum_url(forum, format: :json)
