proc hashFn*(key: string, length: int) =
    let primeNum = 31
    var total = 0
    for i in key:
        total = (total * primeNum + int(i)) mod length
    echo total
