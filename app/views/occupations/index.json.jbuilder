json.array! @occupations do |ocp|
  json.name ocp.name
  json.creditLevel ocp.creditLevel
  json.calcType ocp.calcType

  json.skills(ocp.skills) do |skill|
    json.merge! skill.name
  end

  json.picks(ocp.picks) do |pick|
    json.numberOfPicks pick.numberOfPicks
    json.pickAny pick.pickAny
    json.skills(pick.skills) do |pskill|
      json.merge! pskill.name
    end
  end
end
