json.array! @occupations do |ocp|
  json.name ocp.name
  json.array! [ocp.min_credit, ocp.max_credit]
  json.calc_type ocp.calc_type

  json.skills(ocp.skills) do |skill|
    json.merge! skill.name
  end

  json.picks(ocp.picks) do |pick|
    json.number_of_picks pick.number_of_picks
    json.pick_any pick.pick_any
    json.skills(pick.skills) do |pskill|
      json.merge! pskill.name
    end
  end
end
