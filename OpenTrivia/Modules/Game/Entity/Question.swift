//
//  Question.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

struct QuestionModel: Codable {
    
    let category: String?
    let type: String?
    let difficulty: String?
    let question: String?
    let correctAnswer: String?
    let incorrectAnswers: [String]?

    enum CodingKeys: String, CodingKey {
        case category
        case type
        case difficulty
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        difficulty = try values.decodeIfPresent(String.self, forKey: .difficulty)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        correctAnswer = try values.decodeIfPresent(String.self, forKey: .correctAnswer)
        incorrectAnswers = try values.decodeIfPresent([String].self, forKey: .correctAnswer)
    }
    
    func getAnswers() -> [String]? {
        
        // TODO Hacer que agregue la respuesta correcta en una posición random
        
        var answers: [String] = []
        
        if let incorrectAnswers = self.incorrectAnswers {
            
            for answer in incorrectAnswers {
                
                answers.append(answer)
            }
            
            if let correctAnswers = self.correctAnswer {
                
                answers.append(correctAnswers)
            }
        }
        
        return answers
    }
}
