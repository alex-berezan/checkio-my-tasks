def copy_with_adding(a_list, item_to_add):
	copied = a_list[:]
	copied.append(item_to_add)
	return copied

def copy_with_removal_at(list, removal_index):
	result_list = list[:]
	del result_list[removal_index]
	return result_list

def to_result_value(left_list, right_list):
	dif = abs((sum(left_list) - sum(right_list)))
	hands = sorted([sorted(left_list), sorted(right_list)], key=lambda a: len(a))
	hands.append(dif)
	return hands

def store(result_hash, left_list, right_list):
	value = to_result_value(left_list, right_list)
	key = str(value)
	result_hash[key] = value

def gamble(result_hash, current_list, remaining_list):
	store(result_hash, current_list, remaining_list)
	if(len(remaining_list) == 0):
		return
	i = 0
	for item in remaining_list:
		gamble(result_hash, copy_with_adding(current_list, item), copy_with_removal_at(remaining_list, i))
		i += 1

def value(item): return item[2][0]
 
def checkio(remaining_list):
	result_hash = dict()
	gamble(result_hash, [], remaining_list)
	combinations = sorted(result_hash.values(),key=lambda a:a[2])
	return combinations[0][2]

def do_assert(condition, message):
	if condition:
		print("PASS - {message}".format(message=message))
		return
	print ("FAIL - {message}".format(message=message))

if __name__ == '__main__':
	do_assert(checkio([10, 10]) == 0,  "First,  with equal weights")
	do_assert(checkio([10]) == 10,  "Second,  with single detail")
	do_assert(checkio([5, 8, 13, 27, 14]) == 3,  "Third,  more complex")
	do_assert(checkio([5, 5, 6, 5]) == 1,  "Fourth,  with one different detail")
	do_assert(checkio([12, 30, 30, 32, 42, 49]) == 9,  "Fifth,  with big numbers")
	do_assert(checkio([1, 1, 1, 3]) == 0,  "Sixth,  don't forget - you can hold different quantity of details")