import math
proc search_binary*[T](inputArray: openArray[T], value: T): int =
    ## Binary Search Implementaion
    ## Takes an sorted array and a value to be searched
    ## Returns the index of value if found else -1
    ## Array type and value type must be of the same type
    var start = 0
    var last = inputArray.len - 1
    var middle =  floor((start+last)/2).toInt
    
    while start <= last:
        if inputArray[middle] < value:
            start = middle+1
        elif inputArray[middle] > value:
            last = middle - 1
        else:
            return middle
        middle = floor((start+last)/2).toInt
    return -1

proc search_binary*[T, K](inputArray: openArray[T], value: K, c:proc(item: T):K{.closure.}): int =
    ## Linear Search with callback for user-defined type
    var start = 0
    var last = inputArray.len - 1
    var middle =  floor((start+last)/2).toInt
    
    while start < last:
        if c(inputArray[middle]) < value:
            start = middle+1
        elif c(inputArray[middle]) > value:
            last = middle - 1
        else:
            return middle
        middle = floor((start+last)/2).toInt
    return -1

