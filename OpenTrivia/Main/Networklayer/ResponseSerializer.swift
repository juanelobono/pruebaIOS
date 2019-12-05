//
//  ResponseSerializer.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Alamofire
import Foundation

extension DataRequest {
    /// @Returns - DataRequest
    /// completionHandler handles JSON Object T
    @discardableResult func responseObject<T: Decodable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<T>) -> Void
    ) -> Self {
        let responseSerializer = DataResponseSerializer<T> { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            let result = DataRequest.serializeResponseData(response: response, data: data, error: error)
            guard case let .success(jsonData) = result else {
                return .failure(error!)
            }

            debugPrint(result)

            // (1)- Json Decoder. Decodes the data object into expected type T
            // throws error when failes

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: jsonData)
                debugPrint("RESPONSE:",  responseObject)
                return .success(responseObject)
            } catch {
                return .failure(error)
            }
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }

    /// @Returns - DataRequest
    /// completionHandler handles JSON Array [T]
    @discardableResult func responseCollection<T: Decodable>(
        queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<[T]>) -> Void
    ) -> Self {
        let responseSerializer = DataResponseSerializer<[T]> { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            let result = DataRequest.serializeResponseData(response: response, data: data, error: error)
            guard case let .success(jsonData) = result else {
                return .failure(error!)
            }

            let decoder = JSONDecoder()
            guard let responseArray = try? decoder.decode([T].self, from: jsonData) else {
                return .failure(error!)
            }

            debugPrint("RESPONSE:", responseArray)
            return .success(responseArray)
        }
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}

