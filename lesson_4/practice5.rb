flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
selected_name_index = []

flintstones.each_with_index do |name, idx|
  if name.start_with?("Be")
    selected_name_index << idx
    break
  end
end

puts selected_name_index