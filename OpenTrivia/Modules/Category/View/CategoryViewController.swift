//
//  CategoryCategoryViewController.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController, CategoryViewInput {

    var output: CategoryViewOutput!
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = GameViewModel()

    // MARK: Properties

    var presenter: CategoryPresenter?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = viewModel

        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        
        tableView?.register(PlayersInfoCell.nib, forCellReuseIdentifier: PlayersInfoCell.identifier)
        tableView?.register(QuestionCell.nib, forCellReuseIdentifier: QuestionCell.identifier)
        tableView?.register(AnswerCell.nib, forCellReuseIdentifier: AnswerCell.identifier)
    }


    // MARK: CategoryViewInput
    func setupInitialState() {
    }
}
