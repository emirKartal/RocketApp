//
//  LaunchModel.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

struct LaunchModel: Codable {
    var flightNumber: Int?
    var missionName: String?
    var launchYear: String?
    var launchDateUtc: Date?
    var launchSuccess: Bool?
    var rocket: RocketModel?
    var launchFailureDetails: LaunchFailureDetailModel?
    var launchSite: LaunchSite?
    
}

struct LaunchFailureDetailModel: Codable {
    var reason: String?
}

struct LaunchSite: Codable {
    var siteId: String?
    var siteName: String?
}
