json.array! @picks do |pick|
  json.id pick.id
  json.name pick.name
  json.number_of_skills pick.skills.length
  json.number_of_picks pick.number_of_picks
  json.pick_any pick.pick_any
  json.created_at pick.created_at
  json.updated_at pick.updated_at
  json.game_set_id pick.game_set_id
end
