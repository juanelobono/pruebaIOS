//
//  CategoryCategoryPresenterTests.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import XCTest

class CategoryPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: GameInteractorInput {
        func getQuestions() {
            
        }


    }

    class MockRouter: GameRouterInput {

    }

    class MockViewController: GameViewInput {
        func setupInitialState() {
            
        }

        func showLoader() {

        }

        func hideLoader() {

        }

        func onResponse(response: QuestionResponseModel) {

        }

        func onFailure(error: Error) {

        }

    }
}
