json.extract! friends_record, :id, :first_name, :last_name, :email, :twitter, :phone, :created_at, :updated_at
json.url friends_record_url(friends_record, format: :json)
