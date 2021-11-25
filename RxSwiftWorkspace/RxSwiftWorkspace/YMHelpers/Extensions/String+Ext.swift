//
//  UIWindow+Ext.swift
//  DouYinSwift5
//
//  Created by lym on 2020/7/23.
//  Copyright © 2020 lym. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    /// 字符串转换成UIViewController?
    /// - Returns: UIViewController?
    func toViewController() -> UIViewController? {
        if isEmpty {
            return nil
        }
        // 1.获取命名空间
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return nil
        }
        // 2.获取Class
        let vcClass: AnyClass? = NSClassFromString(name + "." + self)
        guard let typeClass = vcClass as? UIViewController.Type else {
            return nil
        }
        // 3.创建vc
        let vc = typeClass.init()
        return vc
    }
}

public extension String {
    func contains(regular: String) -> Bool {
        return range(of: regular, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

public extension String {
    subscript(r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound, limitedBy: endIndex) ?? endIndex
        let end = index(startIndex, offsetBy: r.upperBound, limitedBy: endIndex) ?? endIndex
        return String(self[start ..< end])
    }

    subscript(n: Int) -> String {
        return self[n ..< n + 1]
    }

    subscript(str: String) -> Range<Index>? {
        return range(of: str)
    }

    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        return self[..<index(startIndex, offsetBy: value.upperBound)]
    }

    subscript(value: PartialRangeThrough<Int>) -> Substring {
        return self[...index(startIndex, offsetBy: value.upperBound)]
    }

    subscript(value: PartialRangeFrom<Int>) -> Substring {
        return self[index(startIndex, offsetBy: value.lowerBound)...]
    }

    subscript(value: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: value.lowerBound)
        let end = index(startIndex, offsetBy: value.upperBound)
        return self[start ..< end]
    }

    subscript(value: ClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: value.lowerBound)
        let end = index(startIndex, offsetBy: value.upperBound)
        return self[start ... end]
    }
}
