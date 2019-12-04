//
//  APIRouter.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    case questions(amount: Int, category: Int, difficulty: String, type: String)
    case forecast(latitudes: Double, longitude: Double)
    
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        case .questions:
        return .get
        }
    }
    
    // MARK: - Path
    
    private var path: String {
        switch self {
        case .forecast(let latitude, let longitude):
            return "forecast/" + Environment.production.secretKey + "\(latitude),\(longitude)"
        case .questions(let amount, let category, let difficulty, let type):
            return "?amount=20&category=15&difficulty=easy&type=multiple"
        }
    }
    
    // MARK: - Parameters
    
    private var parameters: Parameters? {
        switch self {
        case .forecast:
            return nil
        case .questions:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Environment.production.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.allHTTPHeaderFields = Environment.production.headers
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

