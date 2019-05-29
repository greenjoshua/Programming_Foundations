ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

old_people = []
count = 0

loop do
  names = ages.keys
  person = names[count]
  age = ages[person]
  break if count > names.size
  if age.to_i >= 100
    old_people << age
  end
  count += 1
end

p old_people