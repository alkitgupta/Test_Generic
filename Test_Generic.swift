func solve<T: Hashable & Comparable>(_ arr1: [T], _ arr2: [T]) -> [T] {
    var dict1 = dictionaryFor(arr1)
    var dict2 = dictionaryFor(arr2)
    var missing = [T]()
    
    for (num, count) in dict2 {
        if let countInFirst = dict1[num], countInFirst == count {
            // Element is not missing
        } else {
            missing.append(num)
        }
    }
    
    missing = Array(Set(missing))
    return missing.sorted()
}

func dictionaryFor<T: Hashable>(_ array: [T]) -> [T: Int] {
    var dict = [T: Int]()
    for val in array {
        if var count = dict[val] {
            count += 1
            dict[val] = count
        } else {
            dict[val] = 1
        }
    }
    return dict
}
