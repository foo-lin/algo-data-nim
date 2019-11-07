import math
type
    NodeD[T] = ref object
        val: T
        pre: NodeD[T]
        next: NodeD[T]

    DoublyLL*[T] = object
        head*: NodeD[T]
        tail*: NodeD[T]
        length*: int


proc push*[T](this: var DoublyLL[T], value: T) =
    ## Insert a node at the end of the linkList
    var newNode = NodeD[T](val: value)
    if this.length == 0:
        this.head = newNode
        this.tail = this.head
    else:
        this.tail.next = newNode
        newNode.pre = this.tail
        this.tail = newNode
    this.length.inc

proc pop*[T](this: var DoublyLL[T]): T = 
    ## Removes and returns the last value from the linkList
    if this.length == 0:
        #TODO: raise exception
        return 
    var tempNode: NodeD[T]
    if this.length == 1:
        tempNode = this.head
        this.head = nil
        this.tail = nil
        this.length.dec
        return tempNode.val
    tempNode = this.tail
    this.tail = this.tail.pre
    this.tail.next = nil
    this.length.dec
    return tempNode.val

proc shift*[T](this: var DoublyLL[T]): T =
    ## Remove and returns the first value from the linkList
    if this.length == 0:
        #TODO: raise exception
        return
    var preHead = this.head
    if this.length == 1:
        this.head = nil
        this.tail = nil
    else:
        this.head = preHead.next
        this.head.pre = nil
        preHead.next = nil
    this.length.dec
    return preHead.val

proc unshift*[T](this: var DoublyLL[T], value: T) =
    ## Insert value to the start of the linkList
    var newNode = NodeD[T](val:value)

    if this.length == 0:
        this.head = newNode
        this.tail = newNode
    else:
        this.head.pre = newNode
        newNode.next = this.head
        this.head = newNode
    this.length.inc

proc `[]`*[T](this: DoublyLL[T], index: int): NodeD[T] =
    ## Get return the node for the given index from the linkList
    if index<0 or index>=this.length:
        #TODO: raise exception
        return nil
    if index < ( this.length / 2 ).toInt:
        var counter = 0
        var current = this.head
        while counter != index:
            current = current.next
            counter.inc
            return current
    else:
        var counter = this.length - 1
        var current = this.tail
        while counter != index:
            current = current.pre
            counter.dec
        return current

proc `[]=`*[T](this: DoublyLL[T], index: int, value: T) =
    ## Set the specified index with the given value
    var node = this[index]
    if not isNil(node):
        node.val = value

proc insert*[T](this: var DoublyLL[T], index: int, value: T): bool = 
    ## Insert a node with the given value at the specified index
    if index<0 or index>this.length:
        return false
    if index == 0:
        this.unshift(value)
        return true
    if index == this.length:
        this.push(value)
        return true
    else:
        var newNode = NodeD[T](val: value)
        var preNode = this[index-1]
        newNode.pre = preNode
        newNode.next = preNode.next
        preNode.next.pre = newNode
        preNode.next = newNode
        this.length.inc
        return true

proc remove*[T](this: var DoublyLL[T], index: int): T =
    if index<0 or index>=this.length:
        #TODO: raise exception
        return
    if index == 0:
        return this.shift()
    if index == this.length-1:
        return this.pop()
    var removeNode = this[index]
    removeNode.pre.next = removeNode.next
    removeNode.next.pre = removeNode.pre
    removeNode.next = nil
    removeNode.pre = nil
    this.length.dec
    return removeNode.val

proc initDoublyLL*[T](values: varargs[T]): DoublyLL[T] = 
    ## return a new DoublyLinkList with the input supplied
    for i in values:
        result.push(i)
    
proc toSeq*[T](this: DoublyLL[T]): seq[T] =
    ## Return the seq representation
    var currentNode = this.head
    while not isNil( currentNode):
        result.add(currentNode.val)
        currentNode = currentNode.next
