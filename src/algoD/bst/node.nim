type
    ## Type for binary trees
    NodeBst*[T] = ref object
        val*: T 
        l_child*: NodeBst[T]
        r_child*: NodeBst[T]
