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
    
    @IBOutlet weak var winnerLabel: UILabel!
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
        
        if playersInfo.playerOneScore > playersInfo.playerTwoScore {
            
            winnerLabel.text = "The winner is: \(playersInfo.playerOneName)"
            
        } else if playersInfo.playerOneScore < playersInfo.playerTwoScore {
            
            winnerLabel.text = "The winner is: \(playersInfo.playerTwoName)"
            
        } else {
            
            winnerLabel.text = "Tied game"
        }
        
        playerOneNameLabel.text = playersInfo.playerOneName
        playerOneScoreLabel.text = "Score: \(playersInfo.playerOneScore)"
        playerTwoNameLabel.text = playersInfo.playerTwoName
        playerTwoScoreLabel.text = "Score: \(playersInfo.playerTwoScore)"
        
        self.savePlayersInfo()
    }
    
    func savePlayersInfo() {
        
        do {
            let repository = RealmService<PlayersInfoRealm>()
            try repository.save(item: self.playersInfo!)
            
            let matches = repository.fetchAll()
            print("Matches count: \(matches.count)")
            
        } catch let error {
            
            print(error.localizedDescription)
        }
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Game", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
}
