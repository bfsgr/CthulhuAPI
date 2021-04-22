json.array! @game_sets do |gs|
  json.id gs.id
  json.name gs.name
  json.occupations gs.occupations.length
  json.picks gs.picks.length
  json.skills gs.skills.length
  json.created_at gs.created_at
  json.updated_at gs.updated_at
end
