//
//  String+Ext.swift
//  RxExamples
//
//  Created by jin on 2019/5/29.
//  Copyright © 2019 晋先森. All rights reserved.
//

import Foundation
import UIKit
 
extension String {
 
    func contains(regular:String) -> Bool {
        return self.range(of: regular, options: .regularExpression, range: nil, locale: nil) != nil
    }
    func match(_ regular: String) -> Bool {
        return self.contains(regular: regular)
    }
    
    
    subscript (r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound, limitedBy: self.endIndex) ?? self.endIndex
        let end = self.index(self.startIndex, offsetBy: r.upperBound, limitedBy: self.endIndex) ?? self.endIndex
        return String(self[start..<end])
    }
    subscript (n:Int) -> String {
        return self[n..<n+1]
    }
    subscript (str:String) -> Range<Index>? {
        return self.range(of: str)
    }
    
    
    /// 字符串转换成UIViewController?
    /// - Returns: UIViewController?
    public func toViewController() -> UIViewController? {
        if self.isEmpty {
            return nil
        }
        // 1.获取命名空间
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return nil
        }
        // 2.获取Class
        let vcCls: AnyClass? = NSClassFromString(name + "." + self)
        guard let tyleCls = vcCls as? UIViewController.Type else {
            return nil
        }
        // 3.创建vc
        let vc = tyleCls.init()
        return vc
    }
}
