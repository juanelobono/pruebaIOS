//
//  CategoryCategoryViewOutput.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

protocol GameViewOutput {

    /**
        @author Nexo Soluciones
        Notify presenter that view is ready
    */

    func viewIsReady()

    func onResponse(response: QuestionResponseModel)
    func onFailure(error: Error)
}
