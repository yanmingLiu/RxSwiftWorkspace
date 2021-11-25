//
//  UIView+Rx.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/8.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public extension Reactive where Base: UIView {
    var isHidden: Binder<Bool> {
        return Binder(base) { view, hidden in
            view.isHidden = hidden
        }
    }
}

public extension Reactive where Base: UIControl {
    var isEnabled: Binder<Bool> {
        return Binder(base) { control, value in
            control.isEnabled = value
            control.backgroundColor = value ? UIColor.lightGray : UIColor.blue
        }
    }
}
