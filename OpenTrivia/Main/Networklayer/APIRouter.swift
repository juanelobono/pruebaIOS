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
    case questions(amount: Int?, category: Int?, difficulty: QuestionModelDifficulty?, type: QuestionModelType?)
    
    // MARK: - HTTPMethod
    
    private var method: HTTPMethod {
        switch self {
        case .questions:
        return .get
        }
    }
    
    // MARK: - Path
    
    private var path: String {
        switch self {
        case .questions:
            return "api.php"

            //return "?amount=\(String(describing: amount))&category=\(String(describing: category))&difficulty=\(String(describing: difficulty?.rawValue))&type=\(String(describing: type?.rawValue))"
        }
    }
    
    // MARK: - Parameters
    
    private var parameters: Parameters? {
        switch self {
        case .questions(let amount, let category, let difficulty, let type):

            var parameters = [String: Any]()
            parameters["amount"] = amount ?? 20

            if let category = category {
                parameters["category"] = category
            }

            if let difficulty = difficulty {
                parameters["difficulty"] = difficulty.rawValue
            }

            if let type = type {
                parameters["type"] = type.rawValue
            }

            return parameters
        }
    }
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Environment.production.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        debugPrint("REQUEST: \(urlRequest)")
        
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

