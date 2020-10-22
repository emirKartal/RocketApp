//
//  LaunchTableViewCell.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    @IBOutlet weak var launchNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(with launch: LaunchModel) {
        launchNameLabel.text = launch.missionName
        yearLabel.text = launch.launchYear
        if launch.launchSuccess ?? true {
            reasonLabel.text = launch.details
        } else {
            reasonLabel.text = "Launch failed because of \(launch.launchFailureDetails?.reason ?? "")"
        }
        
    }

}
