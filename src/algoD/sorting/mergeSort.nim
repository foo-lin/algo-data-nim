import sequtils
import math
import random
import times

proc merge_func[T](arr1: seq[T], arr2: seq[T]): seq[T] =
    if len(arr1) == 0:
        return arr2[0..^1]
    elif (len(arr2)) == 0:
        return arr1[0..^1]
    if arr1[0] < arr2[0]:
        return  @[arr1[0]].concat(
            merge_func(arr1[1..^1], arr2[0..^1])
        )
    return @[arr2[0]].concat(
        merge_func(arr1[0..^1], arr2[1..^1])
        )
    

proc sort_merge_func[T](inputArray: seq[T]): seq[T] = 
    ## Functional Implementaion of MergeSort
    ## Returns a new sorted seq for a given array or seq
    ## Slow and cannot handle large arrays 
    #TODO
    if len(inputArray) == 1:
        return inputArray[0..^1]
    let mid = floor(len(inputArray)/2).toInt
    return merge_func(
        sort_merge_func( inputArray[0..<mid]), 
        sort_merge_func( inputArray[mid..^1])
        )

#---------------------------------Merge Sort-------------------------------------#

proc merge[T](arr1, arr2: seq[T]):seq[T] = 
    ## Merge to sorted array into one sorted array
    var 
        i = 0
        j = 0
    while i < arr1.len and j<arr2.len:
        if cmp(arr1[i], arr2[j]) < 0:
            result.add(arr1[i])
            i.inc
        else:
            result.add(arr2[j])
            j.inc
    while i < arr1.len:
        result.add(arr1[i])
        i.inc
    while j < arr2.len:
        result.add(arr2[j])
        j.inc

proc sort_merge*[T](inputArray: seq[T]):seq[T] =
    ## Merge Sort Implementation
    ## Recurssive Not stable 
    if len(inputArray) == 1:
        return inputArray
    let mid =  floor(len(inputArray)/2).toInt
    let left = sort_merge( inputArray[0..<mid])
    let right = sort_merge( inputArray[mid..^1])
    return merge(left, right)

