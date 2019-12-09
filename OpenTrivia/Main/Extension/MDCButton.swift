//
//  MDCButton.swift
//  OpenTrivia
//
//  Created by Leinhio on 05/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import MaterialComponents

extension MDCButton {
    
    func setButtonStyle(_ containerScheme: MDCContainerScheme) {
        
        setElevation(ShadowElevation(rawValue: 6), for: .normal)
        applyContainedTheme(withScheme: containerScheme)
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(red:76/255, green: 175/255, blue: 80/255, alpha: 1)
    }
    
}
