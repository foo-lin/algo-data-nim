import unittest

import sugar

import personData

import algoD/sorting/insertionSort

test "insertion sort in increasing order":
    var arr = [5,4,3,2,1]
    sort_insertion(arr)
    check arr == [1,2,3,4,5]

test "insertion sort in decreasing order":
    var arr = [1,2,3,4,5,6,7]
    sort_insertion(arr, (a, b) => b-a)
    check arr == [7,6,5,4,3,2,1]


test "insertion sort with string len":
    var arr = ["one", "two", "three", "four", "five"]
    sort_insertion(arr, (a, b) => a.len - b.len)
    check arr == ["one", "two", "four", "five", "three"]

test "insertion sort with user define data":
    var arr = personList.deepCopy
    sort_insertion(arr, (a, b)=>a.age - b.age)
    check arr == [ Person(name: "Jilly", age:18 ), Person(name: "John", age: 24),Person(name: "Jill", age: 34), Person(name: "Jack", age: 44)]