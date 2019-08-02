def check_lights(number)
  lights = {}
  
  1.upto(number) { |num| lights[num.to_s] = "on" }
  2.upto(number) do |numb|
    lights.each do |num, value|
      if (num.to_i % numb == 0) && (value == "on")
        lights[num] = "off"
      elsif (num.to_i % numb == 0) && (value == "off")
        lights[num] = "on"
      end
    end
  end

  lights_on = lights.select { |k, v| v == "on" }.keys
  lights_on.map { |num| num.to_i }
end


p check_lights(5)
p check_lights(10)