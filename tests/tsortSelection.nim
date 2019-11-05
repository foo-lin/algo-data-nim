import unittest

import sugar

import personData

import algoD/sorting/sectionSort

test "section sort in increasing order":
    var arr = [5,4,3,2,1]
    sort_selection(arr)
    check arr == [1,2,3,4,5]

test "section sort in decreasing order":
    var arr = [1,2,3,4,5,6,7]
    sort_selection(arr, (a, b) => b-a)
    check arr == [7,6,5,4,3,2,1]


test "section sort with string len":
    var arr = ["one", "two", "three", "four", "five"]
    sort_selection(arr, (a, b) => a.len - b.len)
    check arr == ["one", "two", "four", "five", "three"]

test "section sort with user define data":
    var arr = personList.deepCopy
    sort_selection(arr, (a, b)=>a.age - b.age)
    check arr == [ Person(name: "Jilly", age:18 ), Person(name: "John", age: 24),Person(name: "Jill", age: 34), Person(name: "Jack", age: 44)]