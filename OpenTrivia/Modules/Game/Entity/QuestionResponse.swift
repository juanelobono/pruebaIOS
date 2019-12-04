//
//  QuestionResponse.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

struct QuestionResponseModel: Codable {
    
    let questions: [QuestionModel]?

    enum CodingKeys: String, CodingKey {
        case questions = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        questions = try values.decodeIfPresent([QuestionModel].self, forKey: .questions)
    }
}
