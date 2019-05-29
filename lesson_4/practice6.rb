flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|word| word = word.slice(0, 3)}

puts flintstones