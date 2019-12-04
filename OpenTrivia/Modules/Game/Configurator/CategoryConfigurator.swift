//
//  CategoryCategoryConfigurator.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class GameModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? GameViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: GameViewController) {

        let router = GameRouter()

        let presenter = GamePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GameInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
