//
//  BaseData.swift
//  News
//
//  Created by lym on 2019/6/11.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import HandyJSON

class BaseData<T>: HandyJSON {
    var code: Int?
    var message: String?
    var data: T?

    public required init() {}

    func mapping(mapper: HelpingMapper) {
        mapper <<<
            data <-- "result"
    }
}
