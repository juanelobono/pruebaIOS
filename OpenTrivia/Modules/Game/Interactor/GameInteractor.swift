//
//  CategoryCategoryInteractor.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

class GameInteractor: GameInteractorInput {

    weak var output: GameInteractorOutput!
    let services = QuestionsServices()

    func getQuestions() {
        services.executeQuestions() { response in
            if let response = response.result.value {
                self.output?.onResponse(response: response)
            } else {
                self.output?.onFailure(error: response.error ?? NSError(domain: "", code: 2000, userInfo: ["Error": "Something went wrong"]))
            }
        }
    }
}
