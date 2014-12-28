json.array!(@moves) do |move|
  json.extract! move, :id, :title, :description, :results, :start_date, :end_date, :user_id, :project_id, :category_id, :inscription_id, :container_id
  json.url move_url(move, format: :json)
end
