def checkio(stones)
	left = [0, []]
	right = [0, []]
	sorted = stones.sort()
	whilekkkkkk(sorted.length() > 0)
		hand = left[0] < right[0] ? left : right
		stone = sorted.pop()
		hand[0] += stone
		hand[1] << stone
	end

	# println left
	# println right
	return (left[0] - right[0]).abs
end

# util methods
def println(message)
	print "#{message}\n"
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