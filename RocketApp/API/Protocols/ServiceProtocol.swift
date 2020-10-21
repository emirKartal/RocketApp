//
//  ServiceProtocol.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation
import Moya

protocol ServiceProtocol: ErrorProtocol {
    var provider: MoyaProvider<RocketApi>! { get set }
    init(isMock:Bool)
}
extension ServiceProtocol {
    func moyaPlugins() -> [PluginType] {
        return [StatusCodePlugin()]
    }
}
