json.array! @game_sets do |gs|
  json.id gs.id
  json.name gs.name
  json.created_at gs.created_at
  json.updated_at gs.updated_at
end
