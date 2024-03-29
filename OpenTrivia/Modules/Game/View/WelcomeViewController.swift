//
//  WelcomeViewController.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit
import MaterialComponents

class WelcomeViewController: UIViewController {
    

    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    @IBOutlet weak var playButton: MDCButton!
    @IBOutlet weak var previousMatchesButton: MDCButton!
    
    
    var playersInfo: PlayersInfo!
    var containerScheme = MDCContainerScheme()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playButton.setButtonStyle(containerScheme)
        previousMatchesButton.setButtonStyle(containerScheme)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        
        self.setPlayerInfo()
        self.goToGame()
    }
    
    @IBAction func previousMatchesTapped(_ sender: Any) {
        
        //Go to previous matches
        performSegue(withIdentifier: "showPreviousMatches", sender: nil)
    }
    
    func setPlayerInfo() {
        
        self.playersInfo = PlayersInfo(entity: PlayersInfoRealm())
        self.playersInfo.id = self.currentTimeMillis()
        
        if let playerOne = playerOneTextField.text {
            
            self.playersInfo.playerOneName = !playerOne.isEmpty ? playerOne : "Player one"
        }
        
        if let playerTwo = playerTwoTextField.text {
            
            self.playersInfo.playerTwoName = !playerTwo.isEmpty ? playerTwo : "Player two"
        }
    }
    
    func goToGame() {
        
        let viewController = GameRouter.setupModule()
        viewController.modalPresentationStyle = .fullScreen
        viewController.playersInfo = self.playersInfo
        self.present(viewController, animated: true, completion: nil)
    }
    
    func currentTimeMillis() -> Int64 {
        
        let nowDouble = NSDate().timeIntervalSince1970
        return Int64(nowDouble * 1000)
    }
}
