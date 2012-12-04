def println(s)
	print "#{s}\n"
end

def copy(list)
	a_copy = []
	list.each { |item| a_copy << item }
	return a_copy
end

def sum(list)
	a_sum = 0
	list.each { |item| a_sum += item }
	return a_sum
end

def copy_with_adding(list, item_to_add)
	return copy(list) << item_to_add
end

def copy_with_removal_at(list, removal_index)
	result_list = copy(list)
	result_list.delete_at(removal_index)
	return result_list
end

def to_result_value(left_list, right_list)
	dif = [(sum(left_list) - sum(right_list)).abs]
	hands = [left_list.sort(), right_list.sort()]
				.sort { |a, b| a.length <=> b.length }
	return hands << dif
end

def store(result_hash, left_list, right_list)
	value = to_result_value(left_list, right_list)
	key = value.to_s()
	result_hash[value.to_s()] = value
end

def gamble(result_hash, current_list, remaining_list)
	store(result_hash, current_list, remaining_list)
	if(remaining_list.length == 0)
		return
	end
	i = 0
	for item in remaining_list
		gamble(result_hash, copy_with_adding(current_list, item), copy_with_removal_at(remaining_list, i))
		i += 1
	end
end

def value(item)
	return item[2][0]
end
 
def checkio(remaining_list) 
	result_hash = Hash.new() 
	gamble(result_hash, [], remaining_list)
	sorted = []
	result_hash.each { |key, value| sorted << value }
	sorted = sorted.sort { |a, b| value(a) <=> value(b) }
	return value(sorted[0])
end

def assert(condition, message)
	if condition
		println "PASS - #{message}"
		return
	end
	println "FAIL - #{message}"
end
  
# assertions
assert(checkio([10, 10]) == 0,  "First,  with equal weights")
assert(checkio([10]) == 10,  "Second,  with single detail")
assert(checkio([5, 8, 13, 27, 14]) == 3,  "Third,  more complex")
assert(checkio([5, 5, 6, 5]) == 1,  "Fourth,  with one different detail")
assert(checkio([12, 30, 30, 32, 42, 49]) == 9,  "Fifth,  with big numbers")
assert(checkio([1, 1, 1, 3]) == 0,  "Sixth,  don't forget - you can hold different quantity of details")