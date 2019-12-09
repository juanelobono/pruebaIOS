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
    case questions(amount: Int, category: Int?, difficulty: QuestionModelDifficulty?, type: QuestionModelType?)
    
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
        }
    }

    // MARK: - Parameters

    private var parameters: Parameters? {
        switch self {
        case .questions(let amount, let category, let difficulty, let type):

            var parameters = [String: Any]()
            parameters["amount"] = amount

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

        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        let headers = Environment.production.headers
        urlRequest.allHTTPHeaderFields = headers

        let urlEncoding = try URLEncoding.default.encode(urlRequest, with: (method == .get) ? parameters : nil)

        debugPrint("---------------------")
        debugPrint(method.rawValue, urlEncoding)
        debugPrint("HEADER:", headers)

        if method != .get {

            // Parameters
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])

                    debugPrint("BODY:", parameters)
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }

        debugPrint("---------------------")

        return urlEncoding
    }
}

