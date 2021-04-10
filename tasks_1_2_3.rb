# Task 1
arr1 = [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
# simple way
arr1.max(2)
arr1.min(2)

# "Bicycle", algoritmic way
def max_two(arr)
  m1= arr[0]
  m2 = arr[1]
  m2, m1 = m1, m2 if m2 > m1
  arr.each do
    |tmp|
	if tmp > m1
	then m2, m1 = m1, tmp
	elsif tmp > m2
	then m2 = tmp
	end
  end
  return [m1,m2]
end

  def min2
    min(2)
  end

p max_two(arr1)
p arr1

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
