//
//  CategoryCategoryPresenter.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

class GamePresenter: GameModuleInput, GameViewOutput, GameInteractorOutput {
    
    weak var view: GameViewInput!
    var interactor: GameInteractorInput!
    var router: GameRouterInput!

    func viewIsReady() {

    }

    func onResponse(response: QuestionResponseModel) {
        view?.onResponse(response: response)
        view?.hideLoader()
    }

    func onFailure(error: Error) {
        view?.hideLoader()
        view?.onFailure(error: error)
    }
}
