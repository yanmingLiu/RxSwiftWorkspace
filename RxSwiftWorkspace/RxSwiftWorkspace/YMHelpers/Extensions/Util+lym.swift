//
//  String+.swift
//  Demo1
//
//  Created by lym on 2019/5/24.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import UIKit

//文档目录
let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString

//缓存目录
let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString

//临时目录
let tempPath = NSTemporaryDirectory() as NSString


func safeAreaBottom() -> CGFloat {
    if #available(iOS 11.0, *) {
        return (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.bottom ?? 0.0
    }
    return CGFloat(0.0)
}

func isIphoneX() -> Bool {
    if UIDevice.current.userInterfaceIdiom != .phone {
        return true
    }
    if #available(iOS 11.0, *) {
        let bootom = safeAreaBottom()
        if bootom > 0.0 {
            return true
        }
    }
    return false
}


func DLog<T>(_ message: T, method: String = #function, line: Int = #line) {
    #if DEBUG
    print("\(method)[\(line)]: \(message)")
    #endif
}


