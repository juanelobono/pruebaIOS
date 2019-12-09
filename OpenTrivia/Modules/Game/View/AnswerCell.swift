//
//  AnswerCell.swift
//  OpenTrivia
//
//  Created by Leinhio on 04/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit
import MaterialComponents

class AnswerCell: UITableViewCell {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerCard: MDCCard!
    
    weak var delegate : AnswerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        answerCard.addGestureRecognizer(tap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    var item: String?  {
        didSet {
            
            answerLabel.text = String(htmlEncodedString: item ?? "")
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        if let delegate = delegate {
            
            delegate.answerSelected(self, answer: item ?? "")
        }
    }
    
}

protocol AnswerCellDelegate: AnyObject {
  func answerSelected(_ answerSelected: AnswerCell, answer: String)
}
