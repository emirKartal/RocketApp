//
//  RocketDetailContracts.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

protocol RocketDetailViewModelProtocol {
    var delegate: RocketDetailViewModelDelegate? {get set}
    var rocketId: String {get}
    func getRocketDetail()
}

protocol RocketDetailViewModelDelegate: class {
    func handleRocketDetailViewModelOutput(_ output: RocketDetailViewModelOutput)
}

enum RocketDetailViewModelOutput {
    case isLoading(Bool)
    case showDetail(RocketDetailModel)
    case showError(String)
}
