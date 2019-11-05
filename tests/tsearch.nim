import algoD/searchAlgo/linearSearch

import unittest
test "found linear Search using int":
    check search_linear([1,2,3,4], 2) == 1

test "not found linear Search using int":
    check search_linear([1,2,3,4], 22) == -1

test "found linear Search using string":
    check search_linear(["hello", "world", "linear", "search"], "search") == 3