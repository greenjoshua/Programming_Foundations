def create_uuid
  characters = []
  
  (0..9).each {|digit| characters << digit.to_s}
  ('a'..'f').each {|letter| characters << letter}
  
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |num, index|
    num.times do |number|
      uuid += characters.sample
    end
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end

puts create_uuid
