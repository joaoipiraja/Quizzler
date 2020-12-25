//
//  ViewController.swift
//  Quizzler
//
//  Created by João Victor Ipirajá de Alencar on 21/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPoints: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    var qb:QuestionBrain = QuestionBrain()

    
    
    @IBAction func setAnswer(_ sender: UIButton) {
        
        qb.checkAnswer(sender.currentTitle!)
        progressBar.setProgress(qb.getProgress(), animated: true)
        lblQuestion.text = qb.getQuestionText()
        lblPoints.text = qb.getScore()
        
        if(!qb.isPlaying()){
            btnTrue.isEnabled = false
            btnFalse.isEnabled = false
            lblQuestion.text = "You hit \(qb.getPercentageScore())!"
        }
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblQuestion.text = qb.getQuestionText()
        
    }


}

