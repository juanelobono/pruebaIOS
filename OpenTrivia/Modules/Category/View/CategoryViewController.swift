//
//  CategoryCategoryViewController.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController, CategoryViewInput {

    var output: CategoryViewOutput!

    // MARK: Properties

    var presenter: CategoryPresenter?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CategoryViewInput
    func setupInitialState() {
    }
}
