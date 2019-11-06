import unittest
import algoD/sorting/quickSort

test "quick sort in increasing order":
    var arr = [3,2,1,5,6,7,8,4]
    sort_quick(arr)
    check arr == @[1,2,3,4,5]

