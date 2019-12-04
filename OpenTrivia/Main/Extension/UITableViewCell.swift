//
//  UITableViewCell.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
//    static var nib: UINib {
//        return UINib(nibName: identifier, bundle: nil)
//    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
