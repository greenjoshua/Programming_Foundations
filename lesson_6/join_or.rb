def joinor(arr, separator=', ', separator_word = 'or')
  if arr.size == 1
    create_sentence = arr[0]
  elsif arr.size == 2
    create_sentence = arr[0].to_s + ' or ' + arr[1].to_s
  else
    last_int = arr.pop.to_s
    create_sentence = ''

    arr.each do |num|
      if create_sentence.empty?
        create_sentence << num.to_s
      else
        create_sentence << separator + num.to_s
      end
    end
    separator_word += ' '
    create_sentence = create_sentence + separator + separator_word +
                      last_int
  end
end

puts joinor([1, 2])                   # => "1 or 2"
puts joinor([1, 2, 3])                # => "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
puts joinor([1])                      # => "1"
