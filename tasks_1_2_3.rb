# Task 1
arr1 = [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
# simple way
arr1.max(2)
arr1.min(2)
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

# Task 2
arr2 = [{ a: 1, b: 2, c: 45 }, { d: 123, c: 12 }, { e: 87 }]

values_arr2 = arr2.map { |hash| hash.values }.flatten
keys_arr2 = arr2.map { |hash| hash.keys }.flatten
# if need uniq keys
uniq_keys = keys_arr2.uniq
summ_values = values_arr2.sum

p values_arr2
p keys_arr2
p summ_values
p uniq_keys

# Task 3
entry = Hash.new(0)
arr3 = [nil, 2, :foo, 'bar', 'foo', 'apple', 'orange', :orange, 45, nil, :foo, :bar, 25, 45, :apple, 'bar', nil]
arr3.map { |el| entry[el] += 1 }
p entry
