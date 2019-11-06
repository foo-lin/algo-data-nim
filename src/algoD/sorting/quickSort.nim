

proc pertition[T](arr: var openArray[T], startIndex:int, endIndex:  int):int=
    var pivot = arr[startIndex]
    var swapInx = startIndex
    for i in startIndex+1..endIndex:
        if pivot>arr[i]:
            swapInx.inc
            swap(arr[swapInx], arr[i])
    swap(arr[startIndex], arr[swapInx])
    return swapInx

proc sort_quick[T](inputArray: var openArray[T], left, right: int) =
    if left<right:
        let pivot = pertition(inputArray, left, right)
        #left side
        sort_quick(inputArray, left, pivot-1)
        #right
        sort_quick(inputArray, pivot+1, right)

proc sort_quick*[T](inputArray: var openArray[T]) =
    sort_quick(inputArray, 0, inputArray.len-1)


