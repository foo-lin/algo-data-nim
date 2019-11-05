import sugar


proc sort_bubble*[T](inputArray: var openArray[T],cmp:proc(a, b: T):int) =
    ##Bubble Sort
    ##Adaptive, Stable, Inplace
    ## Input array to be sorted
    ## Optional Comparator
    var isSorted:bool
    for i in countdown(len(inputArray)-1, 1):
        isSorted = true
        for j in countup(0, i-1):
            if cmp(inputArray[j], inputArray[j+1]) > 0:
                swap(inputArray[j], inputArray[j+1])
                isSorted =false
        if isSorted:
            break

proc sort_bubble*[T](inputArray: var openArray[T]) =
    ##Bubble Sort
    ##Adaptive, Stable, Inplace
    ## Input array to be sorted
    ## Optional Comparator
    var isSorted:bool
    for i in countdown(len(inputArray)-1, 1):
        isSorted = true
        for j in countup(0, i-1):
            if system.cmp(inputArray[j], inputArray[j+1]) > 0:
                swap(inputArray[j], inputArray[j+1])
                isSorted =false
        if isSorted:
            break



