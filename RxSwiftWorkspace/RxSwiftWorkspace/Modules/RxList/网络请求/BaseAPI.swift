//
//  BaseAPI
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/6.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import Moya

struct BaseAPI {
    static var baseURL: URL {
        return try! "http://120.26.88.217:8100".asURL()
    }

    static var headers: [String: String] {
        return ["Content-type": "application/x-www-form-urlencoded; charset=utf-8",
                "ctype": "ios"]
    }

    static let networkActivityPlugin = NetworkActivityPlugin { change, _ -> Void in
        switch change {
        case .ended:
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        case .began:
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
        }
    }
}

extension BaseAPI {
    static func jsonResponseDataFormatter(_ data: Data) -> Data {
        do {
            let json = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it cant be serialized
        }
    }
}
