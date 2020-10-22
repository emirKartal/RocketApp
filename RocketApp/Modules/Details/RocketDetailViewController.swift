//
//  RocketDetailViewController.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import UIKit
import Kingfisher

class RocketDetailViewController: UIViewController {
    
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var firstFlightLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    
    var viewModel: RocketDetailViewModelProtocol! {
        didSet{
            self.viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 9
        cardView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        descriptionView.layer.cornerRadius = 9
        descriptionView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        viewModel.getRocketDetail()
    }
    
    private func setUIElements(with rocket: RocketDetailModel) {
        rocketNameLabel.text = rocket.rocketName
        companyLabel.text = rocket.company
        firstFlightLabel.text = rocket.firstFlight
        descriptionLabel.text = rocket.description
        rocketImageView.kf.indicatorType = .activity
        if let urlString = rocket.flickrImages?.first, let url = URL(string: urlString) {
            let resource = ImageResource(downloadURL: url)
            rocketImageView.kf.setImage(
                with: resource,
                placeholder: nil,
                options: [
                    .processor(DownsamplingImageProcessor(size: rocketImageView.bounds.size)),
                    .scaleFactor(UIScreen.main.scale),
                    .cacheOriginalImage
                ])
        }
    }
}

extension RocketDetailViewController: RocketDetailViewModelDelegate {
    func handleRocketDetailViewModelOutput(_ output: RocketDetailViewModelOutput) {
        switch output {
        case .isLoading(let isLoading):
            isLoading ? Spinner.start() : Spinner.stop()
            break
        case .showDetail(let rocket):
            self.setUIElements(with: rocket)
            break
        case .showError(let error):
            break
        }
    }
}
