import unittest

import algoD/linkList/singlyLL


var sLL = initSinglyLL(1,2,3,4)
test "Create a singly link list":
    check sLL.toSeq == @[1,2,3,4]

test "Push a single item to the end linkList":
    sLL.push(5)
    check sLL.toSeq == @[1,2,3,4,5]

test "Pop the last item from the linkList":
    check sLL.pop == 5

test "Check the length of the linkList":
    check len(sLL) == 4

test "Shift, Remove the first item from the linkList":
    check sLL.shift() == 1

test "Unshift, Add item to the head of the linkList":
    sLL.unshift(1)
    check sLL.toSeq == @[1,2,3,4]

test "Get: Returns the value for the given index":
    check sLL[2].val == 3

test "Set: Set the value at the given index":
    sLL[2] = 33
    check sLL[2].val == 33

test "Inset a value a given index":
    discard sLL.insert(2, 22)
    check sLL.toSeq == @[1,2,22,33,4]

test "Reverse a linklist":
    sLL.reverse()
    check sLL.toSeq == @[4,33,22,2,1]

test "Remove a item at the specified postion from the linkList":
    check sLL.remove(2) == 22