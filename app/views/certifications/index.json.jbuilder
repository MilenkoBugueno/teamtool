json.array!(@certifications) do |certification|
  json.extract! certification, :id, :title, :short_name, :description, :peer_approvements, :level_id, :move_type_id, :moves_goal, :duration
  json.url certification_url(certification, format: :json)
end
