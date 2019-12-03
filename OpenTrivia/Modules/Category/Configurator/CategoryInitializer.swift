//
//  CategoryCategoryInitializer.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class CategoryModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var categoryViewController: CategoryViewController!

    override func awakeFromNib() {

        let configurator = CategoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: categoryViewController)
    }

}
