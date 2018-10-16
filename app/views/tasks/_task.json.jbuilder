json.extract! task, :id, :status, :description, :limit, :list_id, :created_at, :updated_at
json.url task_url(task, format: :json)
