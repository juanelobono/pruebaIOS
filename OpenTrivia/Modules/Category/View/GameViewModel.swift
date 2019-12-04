//
//  GameViewModel.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import UIKit

enum GameViewModelItemType {
    case players
    case question
    case answers
}

protocol GameViewModelItem {
    var type: GameViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class GameViewModel: NSObject {
    var items = [GameViewModelItem]()
    
    override init() {
        super.init()
        
        //Players info
        let playersInfo = PlayersInfo()
        playersInfo.playerOneName = "Leo"
        playersInfo.playerOneScore = 1
        playersInfo.playerTwoName = "Molu"
        playersInfo.playerTwoScore = 1
        
        //Create question
        let question = "In Grand Theft Auto V, what was Michael De Santa's former surname?"
        
        //Create answers
        var answers: [String] = []
        
        answers.append("Townley")
        answers.append("De Santos")
        answers.append("Watson")
        answers.append("Simpsons")
        
        let playerItem = GameViewModelPlayersItem(playersInfo: playersInfo)
        items.append(playerItem)
        
        let questionItem = GameViewModelQuestionItem(question: question)
        items.append(questionItem)
        
        if !answers.isEmpty {
            let answersItem = GameViewModelAnswersItem(answers: answers)
            items.append(answersItem)
        }
    }
}

extension GameViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.section]
        
        switch item.type {
        case .players:
            if let cell = tableView.dequeueReusableCell(withIdentifier: PlayersInfoCell.identifier, for: indexPath) as? PlayersInfoCell {
                cell.item = item
                return cell
            }
        case .question:
        if let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.identifier, for: indexPath) as? QuestionCell {
            cell.item = item
            return cell
        }
        case .answers:
            if let item = item as? GameViewModelAnswersItem, let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.identifier, for: indexPath) as? AnswerCell {
                cell.item = item.answers[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}

class GameViewModelPlayersItem: GameViewModelItem {
    var type: GameViewModelItemType {
        return .players
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return 1
    }
    
    var playersInfo: PlayersInfo
    
    init(playersInfo: PlayersInfo) {
        self.playersInfo = playersInfo
    }
}

class GameViewModelQuestionItem: GameViewModelItem {
    var type: GameViewModelItemType {
        return .question
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return 1
    }
    
    var question: String
    
    init(question: String) {
        self.question = question
    }
}

class GameViewModelAnswersItem: GameViewModelItem {
    var type: GameViewModelItemType {
        return .answers
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return answers.count
    }
    
    var answers: [String]
    
    init(answers: [String]) {
        self.answers = answers
    }
}
