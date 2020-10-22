//
//  RocketDetailViewController.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import UIKit

class RocketDetailViewController: UIViewController {
    
    var viewModel: RocketDetailViewModelProtocol! {
        didSet{
            self.viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension RocketDetailViewController: RocketDetailViewModelDelegate {
    func handleRocketDetailViewModelOutput(_ output: RocketDetailViewModelOutput) {
        switch output {
        case .isLoading(let isLoading):
            break
        case .showError(let error):
            break
        }
    }
}
