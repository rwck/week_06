json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :fullname, :picture, :phone
  json.url user_url(user, format: :json)
end
