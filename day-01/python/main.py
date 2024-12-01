#!/usr/bin/env python3

import re
re_spaces = re.compile(r"\s+")

input_fname = '../input'
# input_fname = '../sample'

locations = []

with open(input_fname, 'r') as f:
	for line in f.readlines():
		# split with regex to handle multiple spaces + int casting
		row = [int(item) for item in re_spaces.split(line.strip())]
		locations.append(row)

left_list = sorted(map(lambda x: x[0], locations))
right_list = sorted(map(lambda x: x[-1], locations))

# part one: sum of distances
distances = [abs(left - right) for left, right in zip(left_list, right_list)]
print("distance:", sum(distances))

# part two: sum of similarities
similarities = [ left * right_list.count(left) for left in left_list]
print("similarity:", sum(similarities))
