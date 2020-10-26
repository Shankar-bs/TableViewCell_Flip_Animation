//
//  ViewController.swift
//  TableViewCellFlip
//
//  Created by Shankar B S on 26/10/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import UIKit

//1
struct  QuizModel {
    let question: String
    let answer: String
}


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cellReuseId = "CustomCell"
    var datasource: [QuizModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2
        createQuizModels()
        
        //3
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: cellReuseId)
    }
    
    //4
    func createQuizModels() {
        let quiz_1 = QuizModel(question: "How do you make the number one disappear?",
                               answer: "Add the letter G and it’s “gone”")
        
        let quiz_2 = QuizModel(question: " What two keys can’t open any door?",
                               answer: "A monkey and a donkey.")
        
        let quiz_3 = QuizModel(question: "What will you actually find at the end of every rainbow?",
                               answer: "The letter “w.”")
        
        let quiz_4 = QuizModel(question: "I start out tall, but the longer I stand, the shorter I grow. What am I?",
                               answer: "A candle.")
        
        let quiz_5 = QuizModel(question: "What can run but not walk?",
                               answer: "Raindrops.")
        
        let quiz_6 = QuizModel(question: "How can the pocket of your pants be empty, but still have something in it?",
                               answer: "When the something is a hole.")
        
        //5
        datasource.append(contentsOf: [quiz_1, quiz_2, quiz_3, quiz_4, quiz_5, quiz_6])
    }
}

//6
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId) as? CustomCell else {
            return UITableViewCell()
        }
        cell.updateWith(quiz: datasource[indexPath.row])
        return cell
    }
}
