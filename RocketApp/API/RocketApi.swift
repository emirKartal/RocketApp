//
//  RocketApi.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation
import Moya

enum RocketApi {
    case getLaunches(limit: Int, offset: Int)
    
}

extension RocketApi: TargetType {
    var baseURL: URL { return URL(string: "https://api.spacexdata.com")! }
    
    var path: String {
        switch self {
        case .getLaunches:
            return "v3/launches"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLaunches:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getLaunches(let limit, let offset):
            let parameters: [String: Any] = ["limit": limit, "offset":offset]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json",
        "Content-Type": "application/json"]
    }
}
