//
//  HomeViewModel.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?
    private var service: LaunchService!
    
    init(isMock: Bool = false) {
        self.service = LaunchService(isMock: isMock)
    }
    
    func getLaunches() {
        service.getLaunches { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let launchList):
                break
            case .failure(let error):
                break
            }
        }
    }
}
