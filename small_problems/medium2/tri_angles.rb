def valid_triangle?(sides)
  return false if sides.any? { |side| side <= 0 }
  return true if sides.reduce(:+) == 180
  false
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if valid_triangle?(sides) == false
  
  if sides.any? { |side| side > 90 }
    return :obtuse
  elsif sides.any? { |side| side == 90 }
    return :right
  elsif sides.all? { |side| side < 90 }
    return :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid