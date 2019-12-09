//
//  PreviousMatchesViewController.swift
//  OpenTrivia
//
//  Created by Leinhio on 06/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class PreviousMatchesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = PreviousMatchesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView?.dataSource = viewModel

        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        
        tableView?.register(PreviousMatchesCell.nib, forCellReuseIdentifier: PreviousMatchesCell.identifier)
        
        self.setPreviousMatches()
    }
    
    func setPreviousMatches() {
        
        //Get matches from database
        do {
            let repository = RealmService<PlayersInfoRealm>()
            let matches = repository.fetchAll()
            print("Matches count: \(matches.count)")
            
            let matchesItem = PreviousMatchesViewModelMatchesItem(matches: matches)
            viewModel.items.append(matchesItem)
        }
    }
}
