//
//  CategoryCategoryPresenter.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

class CategoryPresenter: CategoryModuleInput, CategoryViewOutput, CategoryInteractorOutput {

    weak var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    var router: CategoryRouterInput!

    func viewIsReady() {

    }
}
