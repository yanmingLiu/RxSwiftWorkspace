//
//  MWIconFont.swift
//  Test
//
//  Created by MYK on 2019/5/2.
//  Copyright © 2019 MYK. All rights reserved.
//

import UIKit

/// IconFont
@objcMembers open class MWIconFont: UIFont {
    private class func iconFont(_ size: CGFloat) -> UIFont? {
        if size == 0.0 {
            return nil
        }
        let iconfont = "iconfont" // 字体的名字
        loadMyCustomFont(iconfont)
        return UIFont(name: iconfont, size: size)
    }

    private class func loadMyCustomFont(_ name: String) {
        guard let fontPath = Bundle(for: MWIconFont.self).path(forResource: name, ofType: "ttf") else {
            return
        }
        var error: Unmanaged<CFError>?
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: fontPath)),
              let provider = CGDataProvider(data: data as CFData)
        else {
            return
        }
        if let font = CGFont(provider) {
            CTFontManagerRegisterGraphicsFont(font, &error)
            if error != nil {
                return
            }
        }
    }

    /// 将Int类型的转为String类型的Unicode码，eg: 0xe624 -> \u{E624}
    private class func stringForIcon(_ iconInt: UInt32) -> String? {
        var rawIcon = iconInt
        let xPtr = withUnsafeMutablePointer(to: &rawIcon) { $0 }
        return String(bytesNoCopy: xPtr,
                      length: MemoryLayout<UInt32>.size,
                      encoding: String.Encoding.utf32LittleEndian,
                      freeWhenDone: false)
    }

    /// 生成IconFont
    ///
    /// - Parameters:
    ///   - iconInt: Unicode-Int类型的 eg: 0xe624
    ///   - size: fontSize
    ///   - color: fontColor
    /// - Returns: font?
    @objc public class func attributedString(
        fromIconInt iconInt: UInt32,
        size: CGFloat,
        color: UIColor?) -> NSAttributedString?
    {
        guard let string = stringForIcon(iconInt) else {
            return nil
        }
        return MWIconFont.attributedString(fromIconStr: string, size: size, color: color)
    }

    /// 生成IconFont
    ///
    /// - Parameters:
    ///   - iconStr: Unicode-String类型的 eg: "\u{E624}"
    ///   - size: fontSize
    ///   - color: fontColor
    /// - Returns: font?
    @objc public class func attributedString(
        fromIconStr iconStr: String,
        size: CGFloat,
        color: UIColor?) -> NSAttributedString?
    {
        guard let font = MWIconFont.iconFont(size) else {
            return nil
        }
        var attributes = [NSAttributedString.Key: AnyObject]()
        attributes[NSAttributedString.Key.font] = font
        if let color = color {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        return NSAttributedString(string: iconStr, attributes: attributes)
    }

    /// iconfont生成image
    ///
    /// - Parameters:
    ///   - iconInt: Unicode-Int类型的 eg: 0xe624
    ///   - size: 图片宽高
    ///   - color: 图片颜色
    /// - Returns: image?
    @objc public class func image(
        fromIconInt iconInt: UInt32,
        size: CGSize,
        color: UIColor?,
        edgeInsets: UIEdgeInsets = UIEdgeInsets.zero) -> UIImage?
    {
        guard let string = stringForIcon(iconInt) else {
            return nil
        }
        return MWIconFont.image(fromIconStr: string, size: size, color: color, edgeInsets: edgeInsets)
    }

    /// iconfont生成image
    ///
    /// - Parameters:
    ///   - iconStr: Unicode-String类型的 eg: "\u{E624}"
    ///   - size: 图片宽高
    ///   - color: 图片颜色
    /// - Returns: image?
    @objc public class func image(
        fromIconStr iconStr: String,
        size: CGSize,
        color: UIColor?,
        edgeInsets: UIEdgeInsets = UIEdgeInsets.zero) -> UIImage?
    {
        if size == CGSize.zero {
            return nil
        }
        let pointSize = min(size.width, size.height)
        guard let aString = MWIconFont.attributedString(fromIconStr: iconStr, size: pointSize, color: color) else {
            return nil
        }
        let mString = NSMutableAttributedString(attributedString: aString)

        var rect = CGRect(origin: CGPoint.zero, size: size)
        rect.origin.y -= edgeInsets.top
        rect.size.width -= edgeInsets.left + edgeInsets.right // 运算符优先级注意
        rect.size.height -= edgeInsets.top + edgeInsets.bottom

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        let range = NSRange(location: 0, length: mString.length)

        mString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        // render the attributed string as image using Text Kit
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        mString.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
