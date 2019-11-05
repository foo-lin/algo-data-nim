

proc search_linear*[T](inputArr: openArray[T], val: T) : int = 
    ## Linear Search Implementaion
    ## Takes an array and a value to be searched
    ## Returns the index of value if found else -1
    ## Array type and value type must be of the same type
    for i in 0..<len(inputArr):
        if inputArr[i] == val:
            return i
    return -1

proc search_linear*[T, K](inputArr: openArray[T], val: K, c:proc(item: T):K{.closure.}): int =
    ## Linear Search with callback for user-defined type
    for i in 0..<len(inputArr):
        if c(inputArr[i]) == val:
            return i
    return -1




