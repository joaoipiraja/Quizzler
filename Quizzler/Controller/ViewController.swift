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
    var data: Array<Question> = QuestionLoader().questions
    var i:Int = 0
    
    
    func showQuestion(){
        lblQuestion.text = data[i].question_string
    }
    func progress(){
        let p = Float(i)*(1.0/(Float(data.count)-1.0))
        progressBar.setProgress(p, animated: true)
    }
    func addPoints(){
        let l = lblPoints.text!.split(separator: " ")
        let p = Int(l[0])! + data[i].points
        lblPoints.text = "\(p) \(l[1])"
    }
    func nextQuestion(){
        if((i+1) < data.count){
            i+=1
        }
    }
    
    @IBAction func setAnswer(_ sender: UIButton) {
        
        let answer = Bool((sender.currentTitle)!.lowercased())!
        
        if(data[i].isTrue == answer){
            addPoints()
        }
        
        if((i+1)<data.count){
            nextQuestion()
            progress()
            showQuestion()
        }else{
            btnTrue.isEnabled = false
            btnFalse.isEnabled = false
            lblQuestion.text = "The End!"
        }
        
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        
    }


}

