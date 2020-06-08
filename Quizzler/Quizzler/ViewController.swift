//
//  ViewController.swift
//  Quizzler
//
//  Created by Tohid Fahim on 6/6/20.
//  Copyright © 2020 Tohid Fahim. All rights reserved.
//

import UIKit
import JGProgressHUD

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QustionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
 
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score : \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.width / 13) * CGFloat(questionNumber)
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        }
        else {
            let alert  =  UIAlertController(title: "Awesome", message: "You have finished, do you want to to start over?", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in self.startOver()
            })
            
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        if (correctAnswer == pickedAnswer){
            score += 1
            alert(answer: "RIGHT", imageName : "right.png")
        }
        else {
            
            alert(answer: "WRONG", imageName : "wrong.png")
            
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
    func alert(answer : String, imageName : String){
        let alert = UIAlertController(title: "-", message: "_", preferredStyle: .alert)
        let alert_action = UIAlertAction(title: answer, style: .default, handler: nil)
        
        ///add image to alert
        let imgTitle = UIImage(named: imageName)
        let imgViewTitle = UIImageView(frame: CGRect(x: 110, y: 25, width: 50, height: 50))
        imgViewTitle.image = imgTitle

        alert.view.addSubview(imgViewTitle)
        ///done
        
        alert.addAction(alert_action)
        present(alert, animated: true, completion: nil)
        
        ///timer
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }

    
}
