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
    func getLaunches()
}

protocol HomeViewModelDelegate: class {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput)
}

enum HomeViewModelOutput {
    case isLoading(Bool)
    case showError(String)
}
