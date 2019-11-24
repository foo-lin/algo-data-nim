import ../linkList/singlyLL


type
    ## Queue Implementation with Singly Link List
    ## FIFO
    Queue*[T] = object
        maxSize*: int
        ll*: SingleLL[T]

proc initQueue*[T](size: int = 10) : Queue[T] =
    ## Initialize a queue of give size
    result.maxSize = size

proc enqueue*[T](this: var Queue[T], value: T) = 
    ## Insert a node at start of the link list
    if len(this.ll) == this.maxSize:
        return
    this.ll.push(value)

proc dequeue*[T](this: var Queue[T]) : T =
    ## Removes and return the first item from the link list
    if this.ll.len == 0:
        #TODO: raise error empty queue
        return
    return this.ll.shift()

proc peek*[T](this: Queue[T]):T =
    if this.ll.len > 0:
        return this.ll.head.val

proc isEmpty*[T](this: Queue[T]):bool = this.ll.len == 0

