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
    
    var launchCount: Int?
    private var launches:[LaunchModel] = []
    private var currentCount: Int = 0
    
    init(isMock: Bool = false) {
        self.service = LaunchService(isMock: isMock)
    }
    
    func getLaunches(offset: Int) {
        notify(.isLoading(true))
        service.getLaunches(limit: 20, offset: offset) { [weak self] (result) in
            guard let self = self else {return}
            self.notify(.isLoading(false))
            switch result {
            case .success(let launchList):
                self.launchCount = launchList.1
                self.launches.append(contentsOf: launchList.0)
                if self.currentCount == 0 { self.currentCount = 20 }
                self.notify(.showLaunchList(self.launches))
                break
            case .failure(let error):
                self.notify(.showError(error.localizedDescription))
                break
            }
        }
    }
    
    func getNextPage() {
        if currentCount < launchCount! {
            currentCount += 20
            self.getLaunches(offset: (currentCount-20))
        }
    }
    
    func selectRocket(rocketId: String) {
        let viewModel = RocketDetailViewModel(rocketId: rocketId)
        delegate?.navigate(to: .toRocketDetail(viewModel))
    }
    
    private func notify(_ output: HomeViewModelOutput) {
        delegate?.handleHomeViewModelOutput(output)
    }
}
