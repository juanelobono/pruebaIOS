//
//  GameResultViewController.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit
import MaterialComponents

class GameResultViewController: UIViewController {
    
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: MDCButton!
    
    var playersInfo: PlayersInfo!
    var containerScheme = MDCContainerScheme()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playAgainButton.setButtonStyle(containerScheme)
        
        self.setupResult()
    }
    
    func setupResult() {
        
        playerOneNameLabel.text = playersInfo.playerOneName
        playerOneScoreLabel.text = "Score: \(playersInfo.playerOneScore)"
        playerTwoNameLabel.text = playersInfo.playerTwoName
        playerTwoScoreLabel.text = "Score: \(playersInfo.playerTwoScore)"
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Game", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
}
