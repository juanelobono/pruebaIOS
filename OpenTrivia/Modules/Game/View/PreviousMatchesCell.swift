//
//  PreviousMatchesCell.swift
//  OpenTrivia
//
//  Created by Leinhio on 06/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class PreviousMatchesCell: UITableViewCell {
    
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerOneScore: UILabel!
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
    
    var item: PlayersInfo?  {
        didSet {
            
            let playersInfo = item
            
            playerOneName.text = playersInfo?.playerOneName
            playerOneScore.text = "Score: \(playersInfo?.playerOneScore ?? 0)"
            playerTwoName.text = playersInfo?.playerTwoName
            playerTwoScore.text = "Score: \(playersInfo?.playerTwoScore ?? 0)"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            let stringDate = dateFormatter.string(from: playersInfo?.date ?? Date())
            matchDate.text = stringDate
        }
    }
    
}
