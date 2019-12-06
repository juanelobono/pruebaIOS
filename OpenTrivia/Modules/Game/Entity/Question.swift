//
//  Question.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

enum QuestionModelType: String {
    case multiple
    case boolean
}

enum QuestionModelDifficulty: String {
    case easy
    case medium
    case hard
}

struct QuestionModel: Codable {
    
    let category: String?
    let type: String?
    let difficulty: String?
    let question: String?
    let correctAnswer: String?
    let incorrectAnswers: [String]?

    var typeIdentifier: QuestionModelType? {
        get {
            if let type = self.type {
                return QuestionModelType(rawValue: type)
            }
            return nil
        }
    }

    var difficultyIdentifier: QuestionModelDifficulty? {
        get {
            if let difficulty = self.difficulty {
                return QuestionModelDifficulty(rawValue: difficulty)
            }
            return nil
        }
    }


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
        incorrectAnswers = try values.decodeIfPresent([String].self, forKey: .incorrectAnswers)
    }
    
    func getAnswers() -> [String]? {
        
        var answers: [String] = []
        
        if let incorrectAnswers = self.incorrectAnswers {
            
            for answer in incorrectAnswers {
                
                answers.append(answer)
            }
            
            if let correctAnswers = self.correctAnswer {
                
                answers.append(correctAnswers)
            }
        }
        
        return answers.shuffled()
    }
}
