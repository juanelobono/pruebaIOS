//
//  Environment.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

enum Environment {
    case production

    var baseURL: String {
        switch self {
        case .production:
            return "https://opentdb.com/api.php"
        }
    }

    var headers: [String: String] {
        switch self {
        case .production:
            return ["Content-Type": "application/json"]
        }
    }

    var secretKey: String {
        switch self {
        case .production:
            return "2d8c8c6571988b81965b115d54b3ff72/"
        }
    }
}

