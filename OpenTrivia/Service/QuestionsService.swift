//
//  QuestionsService.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Alamofire
import Foundation

class QuestionsServices {
    
    // MARK: - Function
    
    internal func executeForcastDetail(latitude: Double, longitude: Double,
                                       completionHandler: @escaping (DataResponse<QuestionResponseModel>) -> ()) {
        let route = APIRouter.forecast(latitudes: latitude, longitude: longitude)

        APIClient.performGet(route: route) { (handler: DataResponse<QuestionResponseModel>) in
            completionHandler(handler)
        }
    }
}
