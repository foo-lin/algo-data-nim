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
    while parentIdx > -1 and this.values[idx]>this.values[parentIdx]:
        swap(this.values[parentIdx], this.values[idx])
        idx = parentIdx
        parentIdx = (floor( (idx - 1) / 2 )).toInt

proc `len`[T](this: MaxBinaryHeap[T]) =
    ## Returns the lenght of the heap
    return this.values.len



