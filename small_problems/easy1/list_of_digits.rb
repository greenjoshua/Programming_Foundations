def to_digits(list)
  list.to_s.split('').map do |num|
    num.to_i
  end
end

p to_digits(12345)