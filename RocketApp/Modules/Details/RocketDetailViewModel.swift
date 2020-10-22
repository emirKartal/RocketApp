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
    var rocketId: Int
    
    init(rocketId: Int) {
        self.rocketId = rocketId
    }
    
    private func notify(_ output: RocketDetailViewModelOutput) {
        delegate?.handleRocketDetailViewModelOutput(output)
    }
    
}
