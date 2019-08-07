//
//  LoginAPI.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/6.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import Moya
import RxSwift


let UserProvider = MoyaProvider<LoginAPI>(endpointClosure:MoyaProvider.defaultEndpointMapping,
                                         plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: BaseAPI.jsonResponseDataFormatter),BaseAPI.networkActivityPlugin])

enum LoginAPI {
    case code(phone: String)

    case login(phone: String , code : String)
}


extension LoginAPI : TargetType {
    var baseURL: URL {
        return BaseAPI.baseURL
    }

    var path: String {
        switch self {
        case .code:
            return "/mobile/smscode"

        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {

        default:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .code(phone: phone):
            return .requestParameters(parameters: ["phone":phone],
                                      encoding: URLEncoding.default)

        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return BaseAPI.headers
    }


}
