require 'pry'
text = File.read("read_this_file.txt")

text_arr = text.split(/[!?.]/)
longest_sentence = ""
longest_length = 0

text_arr.each_with_index do |line, index|
  #binding.pry
  if line.split(" ").count > longest_length
    longest_sentence = line.split(" ").join(" ")
    longest_length = line.split(" ").count
  end
end

puts "The longest sentence is #{longest_length} words long."
puts longest_sentence