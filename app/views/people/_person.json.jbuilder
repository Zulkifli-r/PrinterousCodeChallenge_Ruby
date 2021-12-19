json.extract! person, :id, :name, :phone, :email, :organization, :created_at, :updated_at
json.url person_url(person, format: :json)
