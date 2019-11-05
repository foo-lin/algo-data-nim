
proc sort_insertion*[T](inputArray: var openArray[T]) = 
    ## Insertion Sort
    ## Adaptive Stable InPlace
    var j: int
    for i in countup(0, len(inputArray)-2):
        j = i + 1
        while j>0 and cmp( inputArray[j-1],inputArray[j]) > 0:
            swap(inputArray[j-1], inputArray[j])
            j.dec

proc sort_insertion*[T](inputArray: var openArray[T], cmp: proc(a, b: T):int) = 
    ## Insertion Sort with callback
    ## Adaptive Stable InPlace
    var j: int
    for i in countup(0, len(inputArray)-2):
        j = i + 1
        while j>0 and cmp( inputArray[j-1],inputArray[j]) > 0:
            swap(inputArray[j-1], inputArray[j])
            j.dec


