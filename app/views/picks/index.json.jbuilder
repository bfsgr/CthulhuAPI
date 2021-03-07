json.array! @picks do |pick|
  json.numberOfPicks pick.numberOfPicks
  json.pickAny pick.pickAny
  json.skills(pick.skills) do |pskill|
    json.merge! pskill.name
  end
end
