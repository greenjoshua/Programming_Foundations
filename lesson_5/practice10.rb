arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

incremented_hash = {}

arr.map do |hsh|
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

puts incremented_hash