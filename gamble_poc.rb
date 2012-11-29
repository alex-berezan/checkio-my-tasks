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

def store(results, list1, list2)
	value = [list1.sort(), list2.sort()].sort { |a, b| a.length <=> b.length }
	key = value.to_s()
	value = [list1, list2]
	results[key] = value << [sum(value[0]), sum(value[1]), (sum(value[0]) - sum(value[1])).abs]
end

def gamble(results, currentList, toTakeList)
	store(results, currentList, toTakeList)
	if(toTakeList.length == 0)# currentList.length == toTakeList.length)
		return
	end
	i = 0
	for item in toTakeList
		newList = copy(currentList)
		newList << item
		toTakeListCopy = copy(toTakeList)
		toTakeListCopy.delete_at(i)
		gamble(results, newList, toTakeListCopy)
		i += 1
	end
end

def value(item)
	return item[2][2]
end

def checkio(toTakeList) 
	results = Hash.new() 
	gamble(results, [], toTakeList)
	# println results
	sorted = []
	results.each { |key, value| sorted << value }
	sorted = sorted.sort { |a, b| value(a) <=> value(b) }
	# println sorted
	# sorted.each { |key | println key }
	# println value(sorted[0])
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


# expected result
# 1 - 2 3 4
# 2 - 1 3 4
# 1 2 - 3 4
# 1 2 3 - 4
# 1 4 - 2 3
# 2 4 - 1 3
# 3 4 - 1 2
# 2 3 4 - 1
# 1 3 4 - 2
# 1 2 4 - 3
# 1 2 3 4 - _