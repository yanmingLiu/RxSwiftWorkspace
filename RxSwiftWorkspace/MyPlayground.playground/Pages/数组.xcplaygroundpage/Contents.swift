//: [Previous](@previous)

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}




var arr = [["url": "https//", "width": 2],
           ["url": "https//", "width": 4],
           ["url": "https//", "width": 5]]

arr.insert(["url": "https//", "width": 3], at: 1)
print(arr)

let mapArr = arr.map{ (dic) in
    return dic["width"]
}
print(mapArr)

let flatMapArr = arr.compactMap { (dic) in
    return dic["width"]
}

print(flatMapArr)


//: [Next](@next)
