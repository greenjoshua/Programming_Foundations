# Please write word or multiple words: walk
# There are 4 characters in "walk".

puts "Please write word or multiple words: "
word = gets.chomp
characters = word.count(word, "^ ")

puts "There are #{characters} characters in \"#{word}\"." 