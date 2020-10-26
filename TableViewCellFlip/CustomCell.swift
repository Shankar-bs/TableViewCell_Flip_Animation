//
//  CustomCell.swift
//  TableViewCellFlip
//
//  Created by Shankar B S on 26/10/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    //1
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    //2
    var isFlipped = false
    
    let cornerRadius: CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        questionView.layer.cornerRadius = cornerRadius
        answerView.layer.cornerRadius = cornerRadius
    }
    
    //3
    func updateWith(quiz: QuizModel) {
        questionLabel.text = quiz.question
        answerLabel.text = quiz.answer
    }
    
    //4
    @IBAction func flipAction(_ sender: Any) {
        guard let displayView = isFlipped ? answerView : questionView else { return }
        UIView.transition(with: contentView, duration: 2.0,
                          options: isFlipped ? .transitionFlipFromRight : .transitionFlipFromLeft,
                          animations: { () -> Void in
                            //5
                            self.contentView.insertSubview(displayView, at: 0)
                          }, completion: nil)
        //6
        isFlipped = !isFlipped
    }
}
