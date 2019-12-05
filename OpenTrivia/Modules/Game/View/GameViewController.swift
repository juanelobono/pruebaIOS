//
//  CategoryCategoryViewController.swift
//  OpenTrivia
//
//  Created by Nexo Soluciones on 02/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController, GameViewInput, AnswerSelectedDelegate {
    
    var output: GameViewOutput!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = GameViewModel()
    var playersInfo: PlayersInfo? = nil
    var questions: [QuestionModel]? = nil
    var questionIndex = 0

    // MARK: Properties

    var presenter: GamePresenter?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = viewModel
        viewModel.delegate = self

        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        
        tableView?.register(PlayersInfoCell.nib, forCellReuseIdentifier: PlayersInfoCell.identifier)
        tableView?.register(QuestionCell.nib, forCellReuseIdentifier: QuestionCell.identifier)
        tableView?.register(AnswerCell.nib, forCellReuseIdentifier: AnswerCell.identifier)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.getQuestions()
    }

    // MARK: CategoryViewInput
    func setupInitialState() {
    }
    
    func showLoader() {
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
    }
    
    func onResponse(response: QuestionResponseModel) {
        
        if let questions = response.questions {
            
            print("Response ---> \(questions)")
            
            self.questions = questions
            
            self.setPlayers()
            self.setCurrentQuestion()
            self.setCurrentAnswers()
            
            tableView?.reloadData()
        }
    }
    
    func onFailure(error: Error) {
        
    }
    
    func setPlayers() {
        
        //Players info
        self.setPlayerTurn()
        
        let playerItem = GameViewModelPlayersItem(playersInfo: self.playersInfo!)
        viewModel.items.append(playerItem)
    }
    
    func setPlayerTurn() {
        
        if questionIndex % 2 == 0 {
                   
           self.playersInfo!.playerTurn = 1
           
        } else {
           
           self.playersInfo!.playerTurn = 2
        }
    }
    
    func setCurrentQuestion() {
        
        //Create question
        let question = self.questions?[questionIndex].question ?? ""
        
        let questionItem = GameViewModelQuestionItem(question: question, questionNumber: questionIndex + 1)
        viewModel.items.append(questionItem)
    }
    
    func setCurrentAnswers() {
        
        //Create answers
        let answers = self.questions?[questionIndex].getAnswers() ?? []
        
        if !answers.isEmpty {
            let answersItem = GameViewModelAnswersItem(answers: answers)
            viewModel.items.append(answersItem)
        }
    }
    
    func answerSelected(_ answerSelected: GameViewModel, answer: String) {

        print("Answer selected: \(answer)")
        self.checkAnswer(answer)
    }
    
    func checkAnswer(_ answer: String) {
        
        let correctAnswer = self.questions?[questionIndex].correctAnswer ?? ""
        var title = ""
        var message = ""
        
        if correctAnswer == answer {
            
            title = "Correct answer!"
            message = "You scored a point!"
            self.updateScore()
            
        } else {
            
            title = "Incorrect answer!"
            let decodedAnswer = String(htmlEncodedString: correctAnswer)
            message = "The correct answer is: \(decodedAnswer)"
        }
        
        self.showAlert(title, message)
    }
    
    func updateScore() {
        
        if questionIndex % 2 == 0 {
            
            self.playersInfo?.playerOneScore = self.playersInfo!.playerOneScore + 1
            
        } else {
            
            self.playersInfo?.playerTwoScore = self.playersInfo!.playerTwoScore + 1
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default,  handler: { action in

            self.setupNewQuestion()
        })
        
        alert.addAction(okAction)
       
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupNewQuestion() {
        
        viewModel.items.removeAll()
        
        if self.questionIndex < 19 {
            
            self.questionIndex += 1
            self.setPlayerTurn()
                   
            let playerItem = GameViewModelPlayersItem(playersInfo: self.playersInfo!)
            viewModel.items.append(playerItem)
            self.setCurrentQuestion()
            self.setCurrentAnswers()
            
            tableView?.reloadData()
            
        } else {
            
            //Go to result
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as? GameResultViewController
        destinationVC?.playersInfo = self.playersInfo
    }
}
