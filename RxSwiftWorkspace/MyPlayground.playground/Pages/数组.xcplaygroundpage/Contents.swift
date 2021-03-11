//: [Previous](@previous)

import Foundation

let arr: [Int]? = nil

if ((arr?.isEmpty) != nil) {
    print("空")
}

var sortArr = [1,3,4,5,7,8,10,39,23]

let subArr = sortArr[1 ..< sortArr.count - 1]
print(subArr)

print(sortArr[1])

// 在数组切片中有一点需要注意，数组切片的下标与原始数组中的下标保持一致。如果要取出切片arraySlices中的第一个值，我们要使用arraySlices[3], 而不是arraySlices[0], 如果使用arraySlices[0]就会报错，如下所示：
//print(subArr[0])

print(sortArr.sorted(by: {$0 < $1}))
print(sortArr.sorted(by: {$0 > $1}))

print(sortArr.reversed() as [Int])
let index = sortArr.firstIndex(of: 3)
print(index!)

let array = [ ["a", "b"], ["c", "d"] ]
// 找出包含 d 的那一个数组元素
let index2 = array.index(where: { $0.firstIndex(of: "d") != nil })
print(index2 ?? 0)


for i in 0 ..< 3 {
    if i == 1 {
        break
    }
    print(i)
}


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

arr.removeSubrange(2 ..< arr.count)
print(arr)

let mapArr = arr.map{ (dic) in
    return dic["width"] as! Int * 2
}
print(mapArr)

let flatMapArr = arr.compactMap { (dic) in
    return dic["width"]
}

print(flatMapArr)




//: [Next](@next)
