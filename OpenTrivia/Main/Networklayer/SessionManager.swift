//
//  SessionManager.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 05/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//


import Foundation
import Alamofire

extension SessionManager {

    public static let `default`: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30

        return SessionManager(configuration: configuration)
    }()

}
