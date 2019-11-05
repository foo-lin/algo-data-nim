import unittest
import sugar
import algoD/searchAlgo/binarySearch

import personData

test "successful binary Search using int":
    check search_binary([1,2,3,4], 1) == 0
test "unsuccessful binary Search using int":
    check search_binary([1,2,3,4], 22) == -1


test "successful binary Search using user define type":
    check search_binary(personList, "Jack", (p: Person)=>p.name) == 1

test "unsuccessful binary Search using user define type":
    check search_binary(personList, 45, (p: Person)=>p.age) == -1