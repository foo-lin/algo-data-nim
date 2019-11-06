import unittest
import algoD/sorting/radixSort

test "radix sort in increasing order":
    var arr = [444,533,4,2,55,22]
    sort_radix(arr)
    check arr == @[2,4,22,55,444,533]
