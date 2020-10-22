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
}

protocol HomeViewModelDelegate: class {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput)
}

enum HomeViewModelOutput {
    case isLoading(Bool)
    case showLaunchList([LaunchModel])
    case showError(String)
}
