import node

type
    BST*[T] = object
        root : NodeBst[T]

proc insert*[T](this:var BST[T], value: T) =
    ## Insert a node in the bst 
    var newNode = NodeBst[T](val: value)
    if isNil(this.root):
        this.root = newNode
    else:
        var currentNode = this.root
        var parentNode = this.root
        while not isNil(currentNode):
            parentNode = currentNode
            if value < currentNode.val:
                currentNode = currentNode.l_child
            elif value > currentNode.val:
                currentNode = currentNode.r_child
            else:
                return
        if value < parentNode.val:
            parentNode.l_child = newNode
        else:
            parentNode.r_child = newNode
            
proc find*[T](this: BST[T], value: T):bool =
    ## Return true if the node if found else false
    if isNil(this.root):
        return false
    var currentNode = this.root
    var found = false
    while not isNil(currentNode) and not found:
        if value < currentNode.val:
            currentNode = currentNode.l_child
        elif value > currentNode.val:
            currentNode = currentNode.r_child
        else:
            found = true
    return found

var a = BST[int]()

a.insert(10)
a.insert(2)
a.insert(3)
a.insert(34)
echo a.find(10)
echo repr(a)