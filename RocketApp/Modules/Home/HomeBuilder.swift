//
//  HomeBuilder.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

final class HomeBuilder {
    class func make(viewModel: HomeViewModelProtocol)-> MainNavigationController {
        let navigationVC = R.storyboard.main.mainNavigationController()!
        let vc = navigationVC.viewControllers.first as! HomeViewController
        vc.viewModel = viewModel
        return navigationVC
    }
}
