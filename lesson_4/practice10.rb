munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
counter = 0

loop do
  break if counter > munsters.keys.size - 1
  name = munsters.keys[counter]
  age = munsters[name]['age']
  
  if age.to_i < 18
    munsters[name]['age_group'] = 'kid'
  elsif age.to_i >= 18 && age.to_i <=64
    munsters[name]['age_group'] = 'adult'
  else
    munsters[name]['age_group'] = 'senior'
  end
  counter += 1
end

puts munsters