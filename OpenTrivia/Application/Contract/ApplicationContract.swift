//
//  ApplicationContract.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

protocol ApplicationContract {
    func setupApplicationRoot()
}

protocol ResuableViews {
    static var reuseIdentifier: String { get }
}

extension ResuableViews where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}


protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
