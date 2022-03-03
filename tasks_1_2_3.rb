# Task 1
arr1 = [1, 2, 12, 34, 35, 6, 0, 34, 122, 124, 789, 999, 33, 54, 763, 893]
# simple way
p arr1.max(2)
p arr1.min(2)

# "Bicycle", algoritmic way
# Видно, что и max(2) и min2) будут отличаться в коде только знаками неравенства.
def max_two(arr)
  m1 = arr[0]
  m2 = arr[1]
  m2, m1 = m1, m2 if m2 > m1
  arr[2..].each do |tmp|
    if tmp > m1
    then m2 = m1
         m1 = tmp
    elsif tmp > m2
    then m2 = tmp
    end
  end
  [m1, m2]
end

# Hihg order function,
# where f is comparison lambda
# В таком варианте мы можем и другие
# сравнения использовать (например, как srting)
def order_two(arr, f)
  m1 = arr[0]
  m2 = arr[1]
  return [m1, nil] if m2.nil?

  m2, m1 = m1, m2 if f.call(m2, m1)
  arr[2..].each do |tmp|
    if f.call(tmp, m1)
    then m2 = m1
         m1 = tmp
    elsif f.call(tmp, m2)
    then m2 = tmp
    end
  end
  [m1, m2]
end

def min_2(arr)
  collation = ->(x, y) { x < y }
  order_two(arr, collation)
end

def max_2(arr)
  collation = ->(x, y) { x > y }
  order_two(arr, collation)
end

p max_two(arr1)
p arr1
p min_2(arr1)
p max_2(arr1)

# Task 2
arr2 = [{ a: 1, b: 2, c: 45 }, { d: 123, c: 12 }, { e: 87 }]
# simple_way
values_arr2 = arr2.flat_map { |hash| hash.values }
keys_arr2 = arr2.flat_map { |hash| hash.keys }
# if need uniq keys
uniq_keys = keys_arr2.uniq
summ_values = values_arr2.sum

p values_arr2
p keys_arr2
p summ_values
p uniq_keys

# Повелосипедим
def vse(position, arr_input)
  arr = arr_input.clone
  arr.each_with_object([]) do |el,obj|
    until el.empty? do
      obj.push(el.shift[position])
    end
  end
end

def all_keys (arr)
  vse(0, arr)
end

def all_values (arr)
  vse(1,arr)
end

# Task 3

arr3 = [nil, 2, :foo, 'bar', 'foo', 'apple', 'orange', :orange, 45, nil, :foo, :bar, 25, 45, :apple, 'bar', nil]

# varinant 1
arr3.each_with_object( Hash.new(0) ) { |el, obj| obj[el] += 1 }

# variant 2
arr3.tally

#variant 3
acc = Hash.new(0)
arr_raid = arr3.clone
until arr_raid.empty? do
  acc[ arr_raid.pop ] += 1
end
p acc
