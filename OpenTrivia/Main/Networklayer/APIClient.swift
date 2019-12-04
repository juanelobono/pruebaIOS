//
//  APIClient.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import Alamofire

class APIClient{

    // MARK: - GET MEHTOD
    /// This is the generic webservice method of type 'GET' for web service calling
    ///
    /// - Parameters:
    ///   - action: service end point
    ///   - completionHandler: generic call back completion handler
    class func performGet<T: Decodable>(route: APIRouter, completionHandler: @escaping (DataResponse<T>) -> ()) {
        debugPrint("Route: \(route)")
        Alamofire.request(route).responseObject { (response) in
            completionHandler(response)
        }
    }


}
