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
    case getLaunches
    
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
        case .getLaunches:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json",
        "Content-Type": "application/json"]
    }
}
