//
//  CategoryCategoryRouter.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import UIKit

class CategoryRouter: CategoryRouterInput {

    weak var view: UIViewController?

    static func setupModule() -> CategoryViewController {
        let viewController = CategoryViewController.instantiate(fromAppStoryboard: .Category)
        let presenter = CategoryPresenter()
        let router = CategoryRouter()
        let interactor = CategoryInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}
