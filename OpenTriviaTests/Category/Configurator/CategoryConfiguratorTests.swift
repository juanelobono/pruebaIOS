//
//  CategoryCategoryConfiguratorTests.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import XCTest

class CategoryModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = GameViewControllerMock()
        let configurator = GameModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CategoryViewController is nil after configuration")
        XCTAssertTrue(viewController.output is GamePresenter, "output is not CategoryPresenter")

        let presenter: GamePresenter = viewController.output as! GamePresenter
        XCTAssertNotNil(presenter.view, "view in CategoryPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CategoryPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is GameRouter, "router is not CategoryRouter")

        let interactor: GameInteractor = presenter.interactor as! GameInteractor
        XCTAssertNotNil(interactor.output, "output in CategoryInteractor is nil after configuration")
    }

    class GameViewControllerMock: GameViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
