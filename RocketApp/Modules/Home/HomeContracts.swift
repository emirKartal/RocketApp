//
//  HomeContracts.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? {get set}
    var launchCount: Int? {get}
    func getLaunches(offset: Int)
    func getNextPage()
    func selectRocket(rocketId: Int)
}

protocol HomeViewModelDelegate: class {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput)
    func navigate(to route: HomeRouter)
}

enum HomeViewModelOutput {
    case isLoading(Bool)
    case showLaunchList([LaunchModel])
    case showError(String)
}

enum HomeRouter {
    case toRocketDetail(RocketDetailViewModelProtocol)
}
