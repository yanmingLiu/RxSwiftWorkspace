//: [Previous](@previous)

import Foundation


extension NSNumber {
    /// 显示k数量
    /// - Returns: xxx.xK
    func displayCount() -> String {
        if doubleValue <= 0 {
            return "0"
        }
        if doubleValue < 1000 {
            return description
        }
        if doubleValue >= 999999 {
            return "99.9K"
        }
        let result = doubleValue / 1000.0
        let num1 = NSNumber(value: result)
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.roundingMode = .down
        numberFormatter.positiveSuffix = "K"
        numberFormatter.positiveFormat = "#0.0"
        return numberFormatter.string(from: num1)!
    }
}

var a:NSNumber = NSNumber(value: 999999)


let str = a.displayCount()

print("\(str)")

//: [Next](@next)
