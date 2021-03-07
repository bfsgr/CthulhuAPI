json.array! @picks do |pick|
  json.number_of_picks pick.number_of_picks
  json.pick_any pick.pick_any
  json.skills(pick.skills) do |pskill|
    json.merge! pskill.name
  end
end
