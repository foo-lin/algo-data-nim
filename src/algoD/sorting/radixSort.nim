import math
import sequtils
import sugar

proc getDigit(num, i: int): int =
    ## Returns the number at index i
    return  (floor(abs(num) / (10 ^ i))).toInt mod 10

proc digitCount(num: int): int =
    ## Returns the number of digit in the number 
    if num == 0: return 1
    return (floor(log10(abs(num).toFloat)) + 1).toInt

proc maxDigits[T](inputArray: openArray[T]): int =
    ## Returns the largest digit in the input Arrray
    return max( map(inputArray, proc (x: T):int = digitCount(x)))


proc sort_radix*[T](inputArray: var openArray[T]) = 
    ## Radix sort not camparitive inplace 
    let maxDigitCount = maxDigits(inputArray)
    for i in 0..<maxDigitCount:
        var bucket = newSeq[seq[T]](10)
        for item in inputArray:
            bucket[getDigit(item, i)].add(item)
        var idx = 0
        for j in bucket:
            for k in j:
                inputArray[idx] = k
                idx.inc
        

