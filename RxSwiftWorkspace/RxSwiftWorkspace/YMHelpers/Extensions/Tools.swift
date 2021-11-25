//
//  String+.swift
//  Demo1
//
//  Created by lym on 2019/5/24.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import UIKit

/// 文档目录
let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as NSString

/// 缓存目录
let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last! as NSString

/// 临时目录
let tempPath = NSTemporaryDirectory() as NSString

/// 打印
func dlog<T>(_ message: T, file: StaticString = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        let fileName = (file.description as NSString).lastPathComponent
        print("\n👉\(fileName)\(method)[\(line)]:\n \(message)")
    #endif
}
