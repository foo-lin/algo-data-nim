
proc sort_selection*[T](inputArray: var openArray[T]) =
    ## Section Sort Implementation
    ## Non-Adaptive Non-Stable Inplace
    var min:int
    for i in countup(0, len(inputArray)-1):
        min = i
        for j in countup(i+1, len(inputArray)-1):
            if cmp(inputArray[min], inputArray[j])>0:
                min = j
        if min != i:
            swap(inputArray[min], inputArray[i])

proc sort_selection*[T](inputArray: var openArray[T], cmp:proc(a, b:T):int) =
    ## Section Sort Implementation with callback
    ## Non-Adaptive Non-Stable Inplace
    var min:int
    for i in countup(0, len(inputArray)-1):
        min = i
        for j in countup(i+1, len(inputArray)-1):
            if cmp(inputArray[min], inputArray[j])>0:
                min = j
        if min != i:
            swap(inputArray[min], inputArray[i])
