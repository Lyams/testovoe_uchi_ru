# Task 1
arr1 = [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
# simple way
arr.max(2)
arr.min(2)
# Option with function
class Array
  def max2
    max(2)
  end

  def min2
    min(2)
  end
end
p arr1.max2
p arr1.min2
