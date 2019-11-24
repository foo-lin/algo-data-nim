type
    ## Ref Type of a single Node 
    Node*[T] = ref object
        val*: T
        next*: Node[T]

    SingleLL*[T] = object
        length*: int
        head*: Node[T]
        tail*: Node[T]

proc `len`*(this: SingleLL): int = this.length

proc push*[T](this: var SingleLL[T], value: T) = 
    ## Insert a item at the end of the LinkList
    let tempNode = Node[T](val: value)
    this.length.inc()
    if isNil(this.head):
        this.head = tempNode
        this.tail = tempNode
        return
    this.tail.next = tempNode
    this.tail = tempNode

proc pop*[T](this: var SingleLL[T]): T = 
    ## Remove the last item from the linkList and returns it's value
    if isNil(this.head):
        ## Return -1 if the linkList is empty
        ## Should raise exception
        #TODO:
        return -1
    var current = this.head
    var newTail = current
    while not isNil(current.next):
        newTail = current
        current = current.next
    this.tail = newTail
    this.tail.next = nil
    this.length.dec
    if this.length == 0:
        this.head = nil
        this.tail = nil
    return current.val

proc shift*[T](this: var SingleLL[T]):T =
    ## Removes the first node from the linkList and return the node's value
    if this.length == 0: return  #TODO:
    var tempNode = this.head
    this.head = this.head.next
    this.length.dec
    if this.length == 0:
        this.tail = nil
    return tempNode.val

proc unshift*[T](this: var SingleLL[T], value: T) =
    ## Insert a node at head of linkList
    var newNode = Node[T](val: value)
    if this.length == 0:
        this.head = newNode
        this.tail = newNode
        echo "sdf"
        return
    newNode.next = this.head
    this.head = newNode
    this.length.inc

proc `[]`*[T](this: SingleLL[T], index:int): Node[T] =
    ## Return the value at given index
    if this.length <= index or index<0:
        #TODO: Raise Exception
        return nil
    var currentNode = this.head
    var counter = 0
    while counter!=index:
        counter.inc
        currentNode = currentNode.next
    return currentNode

proc `[]=`*[T](this: SingleLL[T], index:int, value: T) =
    ## Return true if the value is set else false
    var node = this[index]
    if not isNil(node):
        node.val = value

proc insert*[T](this: var SingleLL[T], index:int,  value: T):bool =
    ## Insert a node a the given index and return true/false accordingly
    if index<0 or index>this.length:
        return false
    if index == 0:
        this.unshift(value)
        return true
    elif index == this.length:
        this.push(value)
        return true
    var newNode = Node[T](val:value)
    var preNode = this[index-1]
    var tempNode = preNode.next
    preNode.next = newNode
    newNode.next = tempNode
    this.length.inc
    return true

proc remove*[T](this: var SingleLL[T], index: int): T =
    ## Remove a node at the given index from the linkList
    if index<0 or index>=this.length:
        #TODO: raise exception
        return 
    if index == 0:
        return this.shift()
    if index == this.length-1:
        return this.pop()
    var preNode = this[index-1]
    var removeNode = preNode.next
    echo repr(preNode)
    echo repr(removeNode)
    preNode.next = removeNode.next
    
    this.length.dec
    return removeNode.val

proc reverse*[T](this: var SingleLL[T]) = 
    ## Reverse a singly linkList inplace
    var preNode:Node[T] = nil
    var current = this.head
    var nextNode = current.next
    while not isNil(nextNode):
        current.next = preNode
        preNode = current
        current = nextNode
        nextNode = current.next
    current.next = preNode
    this.tail = this.head
    this.head = current

proc toSeq*[T](this: SingleLL[T]): seq[T] =
    ## Return a new Seq representation of the linkList
    var currentNode = this.head
    while not isNil(currentNode):
        #TODO: enable deep copy for user define data
        result.add( currentNode.val)
        currentNode = currentNode.next
    
proc initSinglyLL*[T](values: varargs[T]): SingleLL[T] =
    for i in values:
        result.push(i)

