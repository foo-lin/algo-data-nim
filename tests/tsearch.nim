import algoD/searchAlgo/linearSearch

import unittest

import sugar

type
    Person = object
        name: string
        age: int

var personList = [Person(name: "John", age: 24), Person(name: "Jack", age: 44), Person(name: "Jill", age: 34), Person(name: "Jilly", age:18 )]


test "found linear Search using int":
    check search_linear([1,2,3,4], 2) == 1

test "not found linear Search using int":
    check search_linear([1,2,3,4], 22) == -1

test "found linear Search using string":
    check search_linear(["hello", "world", "linear", "search"], "search") == 3

test "linear search on user define type on person.age":
    check search_linear(personList, 18, (p:Person)=>p.age) == 3

test "linear search on user define type on person.name":
    check search_linear(personList, "Jack", (p:Person)=>p.name) == 1

test "linear search on user define type on person.name : failed":
    check search_linear(personList, "Jonathan", (p:Person)=>p.name) == -1