import algoD/searchAlgo/linearSearch

import unittest

import sugar

import personData



test "successful linear Search using int":
    check search_linear([1,2,3,4], 2) == 1

test "unsuccessful linear Search using int":
    check search_linear([1,2,3,4], 22) == -1

test "successful linear Search using string":
    check search_linear(["hello", "world", "linear", "search"], "search") == 3

test "linear search on user define type on person.age":
    check search_linear(personList, 18, (p:Person)=>p.age) == 3

test "linear search on user define type on person.name":
    check search_linear(personList, "Jack", (p:Person)=>p.name) == 1

test "linear search on user define type on person.name : failed":
    check search_linear(personList, "Jonathan", (p:Person)=>p.name) == -1