//
//  CategoryCategoryConfigurator.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class CategoryModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CategoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CategoryViewController) {

        let router = CategoryRouter()

        let presenter = CategoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CategoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
