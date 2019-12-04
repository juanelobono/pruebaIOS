//
//  CategoryCategoryViewInput.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

protocol GameViewInput: class {

    /**
        @author Nexo Soluciones
        Setup initial state of the view
    */

    func setupInitialState()
    func showLoader()
    func hideLoader()
    func onResponse(response: QuestionResponseModel)
    func onFailure(error: Error)
}
