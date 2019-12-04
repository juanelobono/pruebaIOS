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
    
    internal func executeQuestions(amount: Int? = nil, category: Int? = nil, difficulty: QuestionModelDifficulty? = nil, type: QuestionModelType? = nil, completionHandler: @escaping (DataResponse<QuestionResponseModel>) -> ()) {
        let route = APIRouter.questions(amount: amount, category: category, difficulty: difficulty, type: type)

        APIClient.performGet(route: route) { (handler: DataResponse<QuestionResponseModel>) in
            completionHandler(handler)
        }
    }
}
