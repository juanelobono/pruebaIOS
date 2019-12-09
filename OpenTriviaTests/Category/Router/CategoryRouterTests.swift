//
//  CategoryCategoryRouterTests.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import XCTest
import Alamofire

class CategoryRouterTests: XCTestCase {

    fileprivate(set) var manager: SessionManager!


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [MockURLProtocol.self]
            return configuration
        }()

        manager = SessionManager(configuration: configuration)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testQuestions() {
        let expectation = XCTestExpectation(description: "Get Questions")

        let json = "{\"response_code\":0,\"results\":[{\"category\":\"Science & Nature\",\"type\":\"multiple\",\"difficulty\":\"easy\",\"question\":\"What is the elemental symbol for mercury?\",\"correct_answer\":\"Hg\",\"incorrect_answers\":[\"Me\",\"Mc\",\"Hy\"]},{\"category\":\"Science: Computers\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"How many Hz does the video standard PAL support?\",\"correct_answer\":\"50\",\"incorrect_answers\":[\"59\",\"60\",\"25\"]},{\"category\":\"Entertainment: Video Games\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"In which order do you need to hit some Deku Scrubs to open the first boss door in &quot;Ocarina of Time&quot;?\",\"correct_answer\":\"2, 3, 1\",\"incorrect_answers\":[\"1, 2, 3\",\"1, 3, 2\",\"2, 1, 3\"]},{\"category\":\"History\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"On which day did construction start on &quot;The Pentagon&quot;, the headquarters for the United States Department of Defense?\",\"correct_answer\":\"September 11, 1941\",\"incorrect_answers\":[\"June 15, 1947\",\"January 15, 1943\",\"September 2, 1962\"]},{\"category\":\"History\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"When was the SS or Schutzstaffel established?\",\"correct_answer\":\"April 4th, 1925\",\"incorrect_answers\":[\"September 1st, 1941\",\"March 8th, 1935\",\"February 21st, 1926\"]},{\"category\":\"Entertainment: Japanese Anime & Manga\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"The main antagonist of the second part of JoJo&#039;s Bizarre Adventure is which of the following?\",\"correct_answer\":\"Kars\",\"incorrect_answers\":[\"Erina Joestar\",\"Santana\",\"Wired Beck\"]},{\"category\":\"Entertainment: Video Games\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"In Touhou: Embodiment of Scarlet Devil, what song plays during Flandre Scarlet&#039;s boss fight?\",\"correct_answer\":\"U.N. Owen Was Her\",\"incorrect_answers\":[\"Septette for the Dead Princess\",\"Flowering Night\",\"Pierrot of the Star-Spangled Banner\"]},{\"category\":\"Entertainment: Music\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"What is the last song on the first Panic! At the Disco album?\",\"correct_answer\":\"Build God, Then We&#039;ll Talk\",\"incorrect_answers\":[\"Nails for Breakfast, Tacks for Snacks\",\"I Write Sins Not Tragedies\",\"Lying Is The Most Fun A Girl Can Have Without Taking Her Clothes Off\"]},{\"category\":\"Entertainment: Video Games\",\"type\":\"multiple\",\"difficulty\":\"medium\",\"question\":\"In the &quot;Call Of Duty: Zombies&quot; map &quot;Origins&quot;, how many numbered power generators are there?\",\"correct_answer\":\"6\",\"incorrect_answers\":[\"8\",\"5\",\"3\"]},{\"category\":\"Entertainment: Film\",\"type\":\"multiple\",\"difficulty\":\"hard\",\"question\":\"What was Humphrey Bogart&#039;s middle name?\",\"correct_answer\":\"DeForest\",\"incorrect_answers\":[\"DeWinter\",\"Steven\",\"Bryce\"]}]}"

        let mockJSONData = json.toJSONData()
        MockURLProtocol.responseWithStatus(code: 200, data: mockJSONData)

        let route = APIRouter.questions(amount: 20, category: nil, difficulty: nil, type: nil)
        APIClient.performGet(manager: manager, route: route) { (handler: DataResponse<QuestionResponseModel>) in
            XCTAssertNotNil(handler)
            let questions = handler.result.value?.questions
            XCTAssertNotNil(questions, "Question list is nil")
            XCTAssertEqual(questions?.first?.typeIdentifier, QuestionModelType.multiple, "First question is not multiple")
            XCTAssertEqual(questions?.first?.difficultyIdentifier, QuestionModelDifficulty.easy)

            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 3)
    }
}
