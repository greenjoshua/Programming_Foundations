def reverse_sentence(input)
  input.split.reverse.join(' ')
end

puts reverse_sentence("Hello World")