//
//  LoginViewModel.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/8.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import RxSwift


class LoginViewModel {



    func isPhone(_ phone : String) -> Observable<Bool> {
        if phone.count != 11 {
            return Observable.just(false)
        }
        let predicateStr = "^1(3|4|5|6|7|8|9)[0-9]\\d{8}$"
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return Observable.just(predicate.evaluate(with: predicateStr))
    }

}

