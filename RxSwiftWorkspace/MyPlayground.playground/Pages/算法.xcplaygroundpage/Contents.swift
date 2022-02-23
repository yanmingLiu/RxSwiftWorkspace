//: [Previous](@previous)

import Foundation

var a = [3, 2, 1, 4, 5, 0, 6, 7, 8, 9]

// 快速排序  >  插入排序  > 选择排序  >  冒泡排序 
// MARK: - 冒泡排序

public extension Array where Element: Comparable {
    mutating func bubbleSort() -> Array {
        let count = self.count
        for i in 0..<count {
            for j in 0..<(count - 1 - i) {
                if self[j] > self[j + 1] {
                    (self[j], self[j + 1]) = (self[j + 1], self[j])
                }
            }
        }
        return self
    }
}

print(a.bubbleSort())

// MARK: - 选择排序

public extension Array where Element: Comparable {
    mutating func selectionSort() -> Array {
        let count = self.count
        for i in 0..<count {
            var minIndex = i
            for j in (i + 1)..<count {
                if self[j] < self[minIndex] {
                    minIndex = j
                }
            }
            (self[i], self[minIndex]) = (self[minIndex], self[i])
        }
        return self
    }
}

print(a.selectionSort())

// MARK: - 插入排序

public extension Array where Element: Comparable {
    mutating func insertionSort() -> Array {
        let count = self.count
        guard count > 1 else { return self }
        for i in 1..<count {
            var preIndex = i - 1
            let currentValue = self[i]
            while preIndex >= 0, currentValue < self[preIndex] {
                self[preIndex + 1] = self[preIndex]
                preIndex -= 1
            }
            self[preIndex + 1] = currentValue
        }
        return self
    }
}

print(a.insertionSort())

// MARK: - 快速排序

public extension Array where Element: Comparable {
    mutating func quickSort() -> Array {
        func quickSort(left: Int, right: Int) {
            guard left < right else { return }
            var i = left + 1, j = left
            let key = self[left]
            while i <= right {
                if self[i] < key {
                    j += 1
                    (self[i], self[j]) = (self[j], self[i])
                }
                i += 1
            }
            (self[left], self[j]) = (self[j], self[left])
            quickSort(left: j + 1, right: right)
            quickSort(left: left, right: j - 1)
        }
        quickSort(left: 0, right: self.count - 1)
        return self
    }
}

print(a.quickSort())

// MARK: -  随机快排

public extension Array where Element: Comparable {
    mutating func randomQuickSort() -> Array {
        func randomQuickSort(left: Int, right: Int) {
            guard left < right else { return }
            let randomIndex = Int.random(in: left...right)
            (self[left], self[randomIndex]) = (self[randomIndex], self[left])
            var i = left + 1, j = left
            let key = self[left]
            while i <= right {
                if self[i] < key {
                    j += 1
                    (self[i], self[j]) = (self[j], self[i])
                }
                i += 1
            }
            (self[left], self[j]) = (self[j], self[left])
            randomQuickSort(left: j + 1, right: right)
            randomQuickSort(left: left, right: j - 1)
        }
        randomQuickSort(left: 0, right: self.count - 1)
        return self
    }
}

print(a.randomQuickSort())

// MARK: -  双路快排

public extension Array where Element: Comparable {
    mutating func quickSort2() -> Array {
        func quickSort(left: Int, right: Int) {
            guard left < right else { return }
            let randomIndex = Int.random(in: left...right)
            (self[left], self[randomIndex]) = (self[randomIndex], self[left])
            var l = left + 1, r = right
            let key = self[left]
            while true {
                while l <= r, self[l] < key {
                    l += 1
                }
                while l < r, key < self[r] {
                    r -= 1
                }
                if l > r { break }
                (self[l], self[r]) = (self[r], self[l])
                l += 1
                r -= 1
            }
            (self[r], self[left]) = (self[left], self[r])
            quickSort(left: r + 1, right: right)
            quickSort(left: left, right: r - 1)
        }
        quickSort(left: 0, right: self.count - 1)
        return self
    }
}

print(a.quickSort2())

// MARK: - 三路快排

public extension Array where Element: Comparable {
    mutating func quickSort3() -> Array {
        func quickSort(left: Int, right: Int) {
            guard left < right else { return }
            let randomIndex = Int.random(in: left...right)
            (self[left], self[randomIndex]) = (self[randomIndex], self[left])
            var lt = left, gt = right
            var i = left + 1
            let key = self[left]
            while i <= gt {
                if self[i] == key {
                    i += 1
                } else if self[i] < key {
                    (self[i], self[lt + 1]) = (self[lt + 1], self[i])
                    lt += 1
                    i += 1
                } else {
                    (self[i], self[gt]) = (self[gt], self[i])
                    gt -= 1
                }
            }
            (self[left], self[lt]) = (self[lt], self[left])
            quickSort(left: gt + 1, right: right)
            quickSort(left: left, right: lt - 1)
        }
        quickSort(left: 0, right: self.count - 1)
        return self
    }
}

print(a.quickSort3())

//: [Next](@next)
