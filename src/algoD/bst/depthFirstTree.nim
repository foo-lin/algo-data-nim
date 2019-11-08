import bst
import node

proc inOrderTraversal*[T](this: BST[T]): seq[T]= 
    proc helperRecc[T](node: NodeBst[T], resultSeq: var seq[T]) =
        if not isNil(node):
            resultSeq.add(node.val)
            helperRecc(node.l_child, resultSeq)
            helperRecc(node.r_child, resultSeq)
    this.root.helperRecc(result)

proc preOrderTraversal*[T](this: BST[T]):seq[T] =
    proc helperRecc[T](node: NodeBst[T], resultSeq: var seq[T]) =
        if not isNil(node):
            helperRecc(node.l_child, resultSeq)
            resultSeq.add(node.val)
            helperRecc(node.r_child, resultSeq)
    this.root.helperRecc(result)

proc postOrderTraversal*[T](this: BST[T]):seq[T] =
    proc helperRecc[T](node: NodeBst[T], resultSeq: var seq[T]) =
        if not isNil(node):
            helperRecc(node.l_child, resultSeq)
            helperRecc(node.r_child, resultSeq)
            resultSeq.add(node.val)
    this.root.helperRecc(result)
    

