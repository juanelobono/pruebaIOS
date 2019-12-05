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
    
    var playersInfo: PlayersInfo!
    var containerScheme = MDCContainerScheme()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playButton.setButtonStyle(containerScheme)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        
        self.setPlayerInfo()
        self.goToGame()
        
    }
    
    func setPlayerInfo() {
        
        self.playersInfo = PlayersInfo()
        self.playersInfo.playerOneName = playerOneTextField.text ?? "Player one"
        self.playersInfo.playerTwoName = playerTwoTextField.text ?? "Player two"
    }
    
    func goToGame() {
        
        let viewController = GameRouter.setupModule()
        viewController.modalPresentationStyle = .fullScreen
        viewController.playersInfo = self.playersInfo
        self.present(viewController, animated: true, completion: nil)
    }
}
