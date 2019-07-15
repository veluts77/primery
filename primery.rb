#!/usr/bin/env ruby

# HALF_TOTAL*2 gives total number of tasks to solve
HALF_TOTAL = 60

def create_plus_pairs(total)
  arr = []
  total.times do
    one = rand 99
    two = rand 99
    res = one + two
    arr.push ['+', one, two, res]
  end
  arr
end

def create_minus_pairs(total)
  arr = []
  total.times do
    one = rand 99
    two = rand 99
    if one > two 
      res = one - two
      arr.push ['-', one, two, res]
    else
      res = two - one
      arr.push ['-', two, one, res]
    end
  end
  arr
end

def str_with_result(pair)
  if pair[0] == '+'
    "#{pair[1]} + #{pair[2]} = #{pair[3]}"
  else
    "#{pair[1]} - #{pair[2]} = #{pair[3]}"
  end
end

def str_with_no_result(pair)
  if pair[0] == '+'
    "#{pair[1]} + #{pair[2]} ="
  else
    "#{pair[1]} - #{pair[2]} ="
  end
end

def print_header
  time = Time.now
  puts """
---------------------------------------------+---------------------------------
без ответов #{time}        | ответы #{time}
---------------------------------------------+---------------------------------
"""
end

def print_columns columns
  HALF_TOTAL.times do |i|
    str1 = str_with_no_result columns[0][i]
    str2 = str_with_no_result columns[1][i]
    str3 = str_with_result columns[0][i]
    str4 = str_with_result columns[1][i]
    puts "#{str1} \t\t #{str2} \t     |   #{str3} \t #{str4}"
  end
end

plus_pairs = create_plus_pairs HALF_TOTAL
minus_pair = create_minus_pairs HALF_TOTAL

all_pairs = plus_pairs + minus_pair
all_pairs.shuffle!

print_header
print_columns [all_pairs.take(HALF_TOTAL), all_pairs.drop(HALF_TOTAL)]
