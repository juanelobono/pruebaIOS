//
//  CategoryCategoryInitializer.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class GameModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var categoryViewController: GameViewController!

    override func awakeFromNib() {

        let configurator = GameModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: categoryViewController)
    }

}
