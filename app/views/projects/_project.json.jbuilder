json.extract! project, :id, :title, :description, :note, :created_at, :updated_at
json.url project_url(project, format: :json)