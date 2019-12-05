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
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = GameViewModel()
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
        
    }
    
    func hideLoader() {
        
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
        let playersInfo = PlayersInfo()
        playersInfo.playerOneName = "Leo"
        playersInfo.playerOneScore = 1
        playersInfo.playerTwoName = "Molu"
        playersInfo.playerTwoScore = 1
        
        let playerItem = GameViewModelPlayersItem(playersInfo: playersInfo)
        viewModel.items.append(playerItem)
    }
    
    func setCurrentQuestion() {
        
        //Create question
        let question = self.questions?[questionIndex].question ?? ""
        
        let questionItem = GameViewModelQuestionItem(question: question)
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
        // Show alert
        let alert = UIAlertController(title: "Subscribed!", message: "Subscribed to \(answer)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        print("Answer selected: \(answer)")
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkAnswer(answer: String) {
        
        let correctAnswer = self.questions?[questionIndex].correctAnswer ?? ""
        
        if correctAnswer == answer {
            
            
        }
    }
}
