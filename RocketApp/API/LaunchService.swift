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
    
    func getLaunches(limit: Int, offset: Int, completion: @escaping(Result<([LaunchModel], Int), APIError>)-> ()) {
        self.provider.request(.getLaunches(limit: limit, offset: offset)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let launchList = try Decoders.mainDecoder.decode([LaunchModel].self, from: response.data)
                    let launchCountString = response.response?.allHeaderFields["spacex-api-count"] as? String
                    let launchCount = Int(launchCountString!)
                    completion(.success((launchList, launchCount!)))
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
    
    func getRocket(rocketId: String, completion: @escaping(Result<RocketDetailModel, APIError>)->()) {
        self.provider.request(.getRocket(id: rocketId)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let rocketDetail = try Decoders.mainDecoder.decode(RocketDetailModel.self, from: response.data)
                    completion(.success(rocketDetail))
                }catch {
                    print(error)
                    completion(.failure(.parseError))
                }
                break
            case .failure(let error):
                break
            }
        }
    }
}
