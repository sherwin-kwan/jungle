# frozen_string_literal: true

# Base case: Array length is 0 or 1, return the array
# Recursive case: Pick random number, multiply by length of array and round down, choose that element as the beginning of a new array, and append the existing array

# Helper methods for the app are stored in this class
module ApplicationHelper

  def ApplicationHelper.shuffle(arr)
    if arr.length < 2
      arr
    else
      chosen_element = arr.delete_at rand(arr.length)
      [chosen_element].concat shuffle(arr)
    end
  end
end

# 100.times do
#   p ApplicationHelper.shuffle([0,1,2,3,4,5,6,7,8,9])
# end