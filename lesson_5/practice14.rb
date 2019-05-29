hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_hsh = hsh.map do |hsh_key, hsh_values|
  fruits = ['grape', 'apple', 'apricot']
  
  if fruits.include?(hsh_key)
    colors =  hsh[hsh_key][:colors]
    colors.each do |color|
      color = color.capitalize!
    end
  else
    hsh[hsh_key][:size].upcase
  end
end

p new_hsh