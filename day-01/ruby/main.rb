#!/usr/bin/env ruby

# input = File.read('../sample')
input = File.read('../input')

locations = input.strip.split("\n").map { _1.split(/\s+/).map(&:to_i) }

left_list = locations.map(&:first).sort
right_list = locations.map(&:last).sort

distances = left_list.zip(right_list).map{ _2 - _1 }.map(&:abs)

puts "distance: #{distances.sum}"

similarities = left_list.map { _1 * right_list.count(_1) }

puts "similarity: #{similarities.sum}"

