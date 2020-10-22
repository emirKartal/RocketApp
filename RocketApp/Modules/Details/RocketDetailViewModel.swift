//
//  RocketDetailViewModel.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

final class RocketDetailViewModel: RocketDetailViewModelProtocol {
    weak var delegate: RocketDetailViewModelDelegate?
    private var service: LaunchService!
    var rocketId: String
    
    init(isMock: Bool = false, rocketId: String) {
        self.rocketId = rocketId
        self.service = LaunchService(isMock: isMock)
    }
    
    func getRocketDetail() {
        notify(.isLoading(true))
        service.getRocket(rocketId: self.rocketId) { [weak self] (result) in
            guard let self = self else {return}
            self.notify(.isLoading(false))
            switch result {
            case .success(let rocket):
                self.notify(.showDetail(rocket))
                break
            case .failure(let error):
                self.notify(.showError(error.localizedDescription))
                break
            }
        }
    }
    
    private func notify(_ output: RocketDetailViewModelOutput) {
        delegate?.handleRocketDetailViewModelOutput(output)
    }
    
}
