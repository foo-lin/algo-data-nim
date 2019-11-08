type
    ## Type Stack using seq LIFO
    Stack[T] = object
        maxSize: int
        arr: seq[T]


proc initStack*[T](size:int = 10): Stack[T] =
    ## initialize a stack of given type and size
    result.maxSize = size

proc push*[T](this: var Stack[T], value: T) = 
    ## Insert the value at the end of the stack
    if this.arr.len == this.maxSize:
        #TODO: raise exception max size reached
        echo "DF"
        return
    this.arr.add(value)

proc pop*[T](this: var Stack[T]): T =
    ## Remove and returns the last element from the stack
    if this.arr.len == 0:
        #TODO: raise exception stack empty
        return
    return this.arr.pop()

