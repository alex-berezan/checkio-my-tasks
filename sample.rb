def normalize(point)
	x = point[0]
	x = x - 2
	if x >= 0 then x = x + 1 end
	
	y = point[1]
	y = y - 2
	if y >= 0 then y = y + 1 end
	return [y, -1 * x]
end

def denormalize(point)
	x = point[0]
	y = point[1]

	if x >= 0 then x = x - 1 end
	x = x + 2

	y = -1 * y
	if y >= 0 then y = y - 1 end
	y = y + 2

	return [y, x]
end

def rotate(point)
	x = point[0]
	y = point[1]

	return [y, -1 * x]
end

def enumerate(map_to_enumerate, &process_item_block)
	i = 0;
	for line in map_to_enumerate
		j = 0
		for item in line
			if item != '.'
				process_item_block.call([i,j])
			end
			j = j+1
		end
		i = i+ 1 
	end	
end

def sort(points)		 return points.sort_by { |point| [point[0], point[1]] } end
def char_at(word, point) return word[point[0]][point[1]] end

def checkio()
	key = [
		['x','.','.','.'],
		['.','.','x','.'],
		['x','.','.','x'],
		['.','.','.','.'],
	]
	word = [
		['i','t','d','f'],
		['g','d','c','e'],
		['a','t','o','n'],
		['q','r','d','i'],
	]

	result = ""
	points = [] 
	enumerate(key, &lambda { |point| points << point })

	for i in (1..4)
		sort(points).each do |point| result += char_at(word, point) end
		rotated = []
		points.each do |point| rotated << denormalize(rotate(normalize(point))) end
		points = rotated
	end

	return result
end

result = checkio()

print "#{result}\n"
print result == "icantforgetiddqd"? "OK\n" : "FAIL\n"