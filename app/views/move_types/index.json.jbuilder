json.array!(@move_types) do |move_type|
  json.extract! move_type, :id, :title, :icon_path, :sprint, :day_plan, :user_story
  json.url move_type_url(move_type, format: :json)
end
