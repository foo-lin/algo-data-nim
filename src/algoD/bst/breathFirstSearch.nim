import strutils
import bst
import node
import ../queue/queue

proc breathFirstSearch*[T](this: BST[T]): seq[T] =
    var queue = initQueue[NodeBst[T]](this.len)
    queue.enqueue(this.root)
    var current: NodeBst[T]
    while not queue.isEmpty:
        current = queue.dequeue()
        result.add(current.val)
        if not isNil(current.l_child):
            queue.enqueue(current.l_child)
        if not isNil(current.r_child):
            queue.enqueue(current.r_child)

