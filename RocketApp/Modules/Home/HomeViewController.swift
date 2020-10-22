//
//  HomeViewController.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var launchTableView: UITableView!
    
    var viewModel: HomeViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }
    private var launchList: [LaunchModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getLaunches(offset: 0)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.launchCell, for: indexPath)!
        let launch = launchList[indexPath.row]
        cell.populateCell(with: launch)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let rocketId = launchList[indexPath.row].flightNumber {
            viewModel.selectRocket(rocketId: rocketId)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.launchList.count - 1) {
            viewModel.getNextPage()
        }
    }
    
    
}

extension HomeViewController: HomeViewModelDelegate {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .isLoading(let isLoading):
            break
        case .showLaunchList(let launchList):
            self.launchList = launchList
            launchTableView.reloadData()
            break
        case .showError(let error):
            break
        }
    }
    
    func navigate(to route: HomeRouter) {
        switch route {
        case .toRocketDetail(let viewModel):
            let rocketDetailVC = RocketDetailBuilder.make(viewModel: viewModel)
            self.navigationController?.pushViewController(rocketDetailVC, animated: true)
        }
    }
}
