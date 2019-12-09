//
//  CategoryCategoryRouter.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import UIKit

class GameRouter: GameRouterInput {

    weak var view: UIViewController?

    static func setupModule() -> GameViewController {
        let viewController = GameViewController.instantiate(fromAppStoryboard: .Game)
        let presenter = GamePresenter()
        let router = GameRouter()
        let interactor = GameInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}
