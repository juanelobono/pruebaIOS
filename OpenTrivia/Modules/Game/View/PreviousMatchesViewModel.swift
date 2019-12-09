//
//  PreviousMatchesViewModel.swift
//  OpenTrivia
//
//  Created by Leinhio on 06/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation
import UIKit

enum PreviousMatchesViewModelItemType {
    case matches
}

protocol PreviousMatchesViewModelItem {
    var type: PreviousMatchesViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class PreviousMatchesViewModel: NSObject {
    var items = [PreviousMatchesViewModelItem]()
    weak var delegate : AnswerSelectedDelegate?
    
    override init() {
        super.init()
    }
}

extension PreviousMatchesViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if items[section].rowCount == 0 {
            
            tableView.setEmptyMessage("You haven't played a game yet.")
            
        } else {
            
            tableView.restore()
        }
        
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.section]
        
        switch item.type {
        case .matches:
            if let item = item as? PreviousMatchesViewModelMatchesItem, let cell = tableView.dequeueReusableCell(withIdentifier: PreviousMatchesCell.identifier, for: indexPath) as? PreviousMatchesCell {
                cell.item = item.matches[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}

class PreviousMatchesViewModelMatchesItem: PreviousMatchesViewModelItem {
    var type: PreviousMatchesViewModelItemType {
        return .matches
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return matches.count
    }
    
    var matches: [PlayersInfo]
    
    init(matches: [PlayersInfo]) {
        self.matches = matches
    }
}
