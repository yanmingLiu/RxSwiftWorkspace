//
//  UIView+.swift
//  Demo1
//
//  Created by lym on 2019/5/22.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import UIKit


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


public func adaptWidth(designWidth: CGFloat = 375.0 , _ vaule: CGFloat) -> CGFloat {
    return UIScreen.main.bounds.size.width / designWidth * vaule
}

extension UIView {
    /// 屏幕适配
    func adaptSubViews() {
        // 约束
        for cons in self.constraints {
            cons.constant = adaptWidth(cons.constant)
        }
        // 圆角
        self.layer.cornerRadius = adaptWidth(self.layer.cornerRadius)

        // 字体大小
        if self.isKind(of: UILabel.self) == true {
            let lbl = self as! UILabel
            lbl.font =  UIFont(name: lbl.font.fontName, size: adaptWidth(lbl.font.pointSize))
        }
        if self.isKind(of: UITextField.self) == true {
            let tf = self as! UITextField
            guard let f = tf.font else {
                return
            }
            tf.font = UIFont(name: f.fontName, size: adaptWidth(f.pointSize))
        }

        if self.isKind(of: UITextView.self) == true {
            let tf = self as! UITextView
            guard let f = tf.font else {
                return
            }
            tf.font = UIFont(name: f.fontName, size: adaptWidth(f.pointSize))
        }

        if self.isKind(of: UIButton.self) == true {
            let btn = self as! UIButton
            if let f = btn.titleLabel?.font {
                btn.titleLabel?.font = UIFont(name: f.fontName, size: adaptWidth(f.pointSize))
            }
        }

        for v in self.subviews {
            v.adaptSubViews()
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }


    /// 添加圆角
    ///
    /// - Parameters:
    ///   - direction: 圆角方向
    ///   - vaule: 圆角值
    func addRadius(direction: UIRectCorner = .allCorners, vaule: CGFloat) {
        let masPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: direction, cornerRadii: CGSize(width: vaule, height: vaule))
        let masLayer = CAShapeLayer()
        masLayer.path = masPath.cgPath
        masLayer.frame = self.bounds

        layer.mask = masLayer
        layer.contentsScale = UIScreen.main.scale
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue > 0 ? newValue : 0
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}


