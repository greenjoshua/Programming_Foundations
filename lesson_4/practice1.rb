# Turn this array into a hash where the names are the keys and 
# the values are the positions in the array.

f_hash = {}
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_index do |val, idx|
  f_hash[val] = idx
end

puts f_hash