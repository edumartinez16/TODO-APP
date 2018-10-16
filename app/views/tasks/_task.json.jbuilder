json.extract! task, :id, :status, :description, :limit, :created_at, :updated_at
json.url task_url(task, format: :json)
