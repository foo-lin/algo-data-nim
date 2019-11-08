import unittest

import algoD/queue/queue

var myQueue = initQueue[int](3)

test "Check the max Size of the created queue":
    check myQueue.maxSize == 3

test "Check enqueue":
    myQueue.enqueue(1)
    myQueue.enqueue(2)
    myQueue.enqueue(3)
    check myQueue.peek() == 1

test "Check dequeue":
    check myQueue.dequeue() == 1