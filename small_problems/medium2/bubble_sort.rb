require 'pry'
require 'pry-byebug'

def bubble_sort!(arr)
  sorted = 0
  
  until sorted >= arr.size
    counter = 0
    sorted = 0
    
    arr.each do |elem|
      unless arr[counter + 1] == nil
        if elem > arr[counter + 1]
          hold_elem = elem
          arr[counter] = arr[counter + 1]
          arr[counter + 1] = hold_elem
        else
          sorted += 1
        end
      end
      #binding.pry  
      if arr[counter + 1] == nil
        if arr[counter - 1] > elem
          hold_elem = elem
          arr[counter] = arr[counter - 1]
          arr[counter - 1] = hold_elem
        else
          sorted += 1
        end
        #binding.pry
      end
      
      counter += 1
    end
    
  end
  
  arr
end





array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)