//
//  LaunchService.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation
import Moya

class LaunchService: ServiceProtocol {
    
    var provider: MoyaProvider<RocketApi>!
    required init(isMock: Bool) {
        if isMock {
            provider = MoyaProvider<RocketApi>(stubClosure: MoyaProvider.immediatelyStub, plugins: self.moyaPlugins())
        } else {
            provider = MoyaProvider<RocketApi>(stubClosure: MoyaProvider.neverStub, plugins: self.moyaPlugins())
        }
    }
    
    func getLaunches(completion: @escaping(Result<[LaunchModel], APIError>)-> ()) {
        self.provider.request(.getLaunches) { (result) in
            switch result {
            case .success(let response):
                do {
                    let launchList = try Decoders.mainDecoder.decode([LaunchModel].self, from: response.data)
                    print(launchList.first?.missionName)
                    completion(.success(launchList))
                }catch {
                    print(error)
                    completion(.failure(.parseError))
                }
                break
            case .failure(let error):
                let errorMessage = self.getResponseError(from: error)
                completion(.failure(errorMessage))
                break
            }
        }
    }
}
