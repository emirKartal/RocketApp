//
//  HomeViewController.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getLaunches()
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput) {
        
    }
}
