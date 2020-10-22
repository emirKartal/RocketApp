//
//  Decoders.swift
//  RocketApp
//
//  Created by emir kartal on 21.10.2020.
//  Copyright © 2020 EmirKartal. All rights reserved.
//

import Foundation

public enum Decoders {
    public static let mainDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Decoders.dateFormat
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" //"2006-03-24T22:30:00.000Z"
}
