def valid_triangle?(sides)
  return false if sides.any? { |side| side <= 0 }
  sides = sides.sort
  
  if sides.reduce(:*) == sides[0] ** 3
    return true
  elsif sides[0] + sides[1] > sides[2]
    return true
  else
    return false
  end
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if valid_triangle?(sides) == false
  
  if sides.count(side1) == 3
    return :equilateral
  elsif (sides.count(side1) == 2) || (sides.count(side2) == 2)
    return :isosceles
  elsif (sides.count(side1) == 1) && (sides.count(side2) == 1)
    return :scalene
  end
end



p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid