import unittest
import algoD/sorting/mergeSort

test "merge sort in increasing order":
    var arr = @[5,4,3,2,1]
    arr = sort_merge(arr)
    check arr == @[1,2,3,4,5]

