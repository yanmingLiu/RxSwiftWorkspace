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
let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString

/// 缓存目录
let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString

/// 临时目录
let tempPath = NSTemporaryDirectory() as NSString



/// 打印
func DLog<T>(_ message: T, method: String = #function, line: Int = #line) {
    #if DEBUG
    print("\(method)[\(line)]: \(message)")
    #endif
}


