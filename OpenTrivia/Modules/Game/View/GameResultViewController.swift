//
//  GameResultViewController.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {
    
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
    
}
