def cleanup(words)
  words = words.split(/[^a-zA-Z0-9_]/)
  words.delete('')
  words.join(' ')
end


=begin
# Without regexp

def cleanup(words)
  letters = ('a'..'z').to_a
  clean_words = []

  words.chars.each do |char|
    if letters.include?(char.downcase)
      clean_words << char
    else
      clean_words << " " unless clean_words.last == " "
    end
  end

  clean_words.join
end

p cleanup("What **$&does $*$*(this do?")
=end

p cleanup("---what's my +*& line?")