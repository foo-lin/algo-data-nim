import unittest

import sugar

import personData

import algoD/sorting/bubbleSort

test "bubble sort in increasing order":
    var arr = [8,7,6,5,4,3]
    sort_bubble(arr)
    check arr == [3,4,5,6,7,8]

test "bubble sort in decreasing order":
    var arr = [1,2,3,4,5,6,7]
    sort_bubble(arr, (a, b) => b-a)
    check arr == [7,6,5,4,3,2,1]


test "bubble sort with string len":
    var arr = ["one", "two", "three", "four", "five"]
    sort_bubble(arr, (a, b) => a.len - b.len)
    check arr == ["one", "two", "four", "five", "three"]