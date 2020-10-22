//
//  RocketDetailBuilder.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

final class RocketDetailBuilder {
    class func make(viewModel: RocketDetailViewModelProtocol)-> RocketDetailViewController {
        let vc = R.storyboard.main.rocketDetailViewController()!
        vc.viewModel = viewModel
        return vc
    }
}
