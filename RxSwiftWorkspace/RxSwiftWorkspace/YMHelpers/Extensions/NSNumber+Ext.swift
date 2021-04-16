//
//  NSNumber+Ext.swift
//  SwiftExtensions
//
//  Created by lym on 2021/4/15.
//

import Foundation

extension NSNumber {
    func displayCount() -> String {
        if doubleValue <= 0 {
            return "0"
        }
        if doubleValue < 1000 {
            return description
        }
        if doubleValue >= 999999 {
            return "999.9K+"
        }
        let result = doubleValue / 1000.0
        let num1 = NSNumber(value: result)
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.roundingMode = .down
        numberFormatter.positiveFormat = "#0.0"
        return numberFormatter.string(from: num1)! + "K"
    }
}
