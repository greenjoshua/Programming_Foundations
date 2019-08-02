require 'pry'
text = File.read("read_this_file.txt")

text_arr = text.split(/[!?.]/).map do |sentence|
  sentence.count
  sentence.split.map do |word|
    word
  end
end
p text_arr