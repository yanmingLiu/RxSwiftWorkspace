//
//  UIView+Rx.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/8.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIView {
    public var isHidden: Binder<Bool> {
        return Binder(self.base) { view, hidden in
            view.isHidden = hidden
        }
    }
}

extension Reactive where Base: UIControl {
    public var isEnabled: Binder<Bool> {
        return Binder(self.base) { control, value in
            control.isEnabled = value
            control.backgroundColor = value ? UIColor.lightGray : UIColor.blue
        }
    }
}


