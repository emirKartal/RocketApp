//
//  RocketDetailModel.swift
//  RocketApp
//
//  Created by emir kartal on 22.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

struct RocketDetailModel: Codable {
    var id: Int?
    var stages: Int?
    var company: String?
    var firstFlight: String?
    var description: String?
    var rocketName: String?
    var flickrImages: [String]?
}
