json.extract! task, :id, :name, :description, :status, :tags, :created_at, :updated_at
json.url dashboard_task_url(task, format: :json)
