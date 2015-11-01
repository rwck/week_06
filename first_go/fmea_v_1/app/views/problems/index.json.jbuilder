json.array!(@problems) do |problem|
  json.extract! problem, :id, :name, :issue, :user_id
  json.url problem_url(problem, format: :json)
end
