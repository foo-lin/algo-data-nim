import math
import strutils
type
    ## max binary heap with seq
    MaxBinaryHeap*[T] = object
        values*: seq[T]


proc insert*[T](this: var MaxBinaryHeap[T], value: T) =
    ## Insert a element into the heap
    this.values.add(value)
    var idx = this.values.len - 1
    var parentIdx = (floor( (idx - 1) / 2 )).toInt
    while idx > 0 and this.values[idx]>this.values[parentIdx]:
        swap(this.values[parentIdx], this.values[idx])
        idx = parentIdx
        parentIdx = (floor( (idx - 1) / 2 )).toInt

proc `len`[T](this: MaxBinaryHeap[T]) =
    ## Returns the lenght of the heap
    return this.values.len

proc remove*[T](this: var MaxBinaryHeap[T]): T =
    if this.values.len == 0:
        return #TODO: raise exception
    swap(this.values[0], this.values[^1])
    result = this.values.pop()

    var idx = 0
    var length = this.values.len
    while true:
        var l_child_idx = 2*idx+1
        var r_child_idx = 2*idx+2
        var swapIdx = -1
        if l_child_idx<length:
            if this.values[idx] < this.values[l_child_idx]:
                swapIdx = l_child_idx
        if r_child_idx < length:
            if this.values[idx] < this.values[r_child_idx] and this.values[l_child_idx] < this.values[r_child_idx]:
                swapIdx = r_child_idx
        if swapIdx == -1: break
        swap(this.values[idx], this.values[swapIdx])
        idx = swapIdx

