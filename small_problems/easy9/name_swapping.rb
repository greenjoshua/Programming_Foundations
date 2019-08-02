def swap_name(name)
  new_str = ''
  name = name.split(" ")
  new_str << name[-1] + ", "
  new_str << name[0]
  new_str
end


p swap_name('Joe Roberts') == 'Roberts, Joe'