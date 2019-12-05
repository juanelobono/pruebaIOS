//
//  PlayersInfoCell.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class PlayersInfoCell: UITableViewCell {
    
    @IBOutlet weak var playerOneImageView: UIImageView!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
    
    @IBOutlet weak var playerTwoImageView: UIImageView!
    @IBOutlet weak var playerTwoName: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    var item: GameViewModelItem? {
        didSet {
            guard let item = item as? GameViewModelPlayersItem else {
            return
        }
            
            let playersInfo = item.playersInfo
            
            playerOneName.text = playersInfo.playerOneName
            playerOneScore.text = "Score: \(playersInfo.playerOneScore)"
            playerTwoName.text = playersInfo.playerTwoName
            playerTwoScore.text = "Score: \(playersInfo.playerTwoScore)"
            
            if playersInfo.playerTurn == 1 {
                
                self.setCurrentTurn(view: playerOneName)
                playerOneName.textColor = .red
                playerTwoName.textColor = .black
                
            } else {
                
                self.setCurrentTurn(view: playerTwoName)
                playerOneName.textColor = .black
                playerTwoName.textColor = .red
            }
        }
    }
    
    func setCurrentTurn(view: UIView) {
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseIn, animations: {
            
            view.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2) // Scale your image

            }) { (finished) in
                UIView.animate(withDuration: 1, animations: {

                   view.transform = CGAffineTransform.identity // undo in 1 seconds
                })
        }
    }
}
