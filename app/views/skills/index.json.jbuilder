json.array! @skills do |skill|
  json.id skill.id
  json.name skill.name
  json.base_value skill.base_value
  json.created_at skill.created_at
  json.updated_at skill.updated_at
  json.game_set_id skill.game_set_id
end
