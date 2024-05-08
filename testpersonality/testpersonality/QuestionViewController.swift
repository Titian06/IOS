//
//  QuestionViewController.swift
//  testpersonality
//
//  Created by Alumno on 10/04/24.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var multiplestackview: UIStackView!
    @IBOutlet weak var multilabel1: UILabel!
    @IBOutlet weak var multilabel2: UILabel!
    @IBOutlet weak var multilabel3: UILabel!
    @IBOutlet weak var multilabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var singlestackview: UIStackView!
    @IBOutlet weak var sButton1: UIButton!
    @IBOutlet weak var sButton2: UIButton!
    @IBOutlet weak var sButton3: UIButton!
    @IBOutlet weak var sButton4: UIButton!
    
    @IBOutlet weak var rangestackview: UIStackView!
    @IBOutlet weak var rangedlabel1: UILabel!
    @IBOutlet weak var rangedlabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var QuestionProgressView: UIProgressView!
    
    
    var questions: [Question] = [
        Question(text: "¿Que comida prefieres?",
                 type: .single,
                 answers: [Answer(text: "Carne", type: .dog),
                           Answer(text: "Pescado", type: .bear),
                           Answer(text: "Dulces", type: .unicorn),
                           Answer(text: "Vegetales", type: .turtle)
                          ]),
        Question(text: "¿Que actividad prefieres hacer?",
                 type: .multiple,
                 answers: [Answer(text: "Nadar", type: .turtle),
                           Answer(text: "Dormir", type: .bear),
                           Answer(text: "Comer", type: .dog),
                           Answer(text: "Arreglarse", type: .unicorn)
                          ]),
        Question(text: "¿Cuanto disfrutas los viajes en cohe?",
                 type: .ranged,
                 answers: [Answer(text: "Los odio", type: .turtle),
                           Answer(text: "Me pongo ansioso", type: .bear),
                           Answer(text: "Esta bien", type: .unicorn),
                           Answer(text: "Lo amo", type: .dog)
                          ]),
    ]
    
    var questionIndex = 0
    var answerChosen: [Answer] = [ ]
    
    override func viewDidLoad( ){
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        
        singlestackview.isHidden = true
        multiplestackview.isHidden = true
        rangestackview.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        QuestionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
        func updateSingleStack(using answers: [Answer]){
            singlestackview.isHidden = false
            sButton1.setTitle(answers[0].text, for: .normal)
            sButton2.setTitle(answers[1].text, for: .normal)
            sButton3.setTitle(answers[2].text, for: .normal)
            sButton4.setTitle(answers[3].text, for: .normal)

        }
        func updateMultipleStack(using answers: [Answer]){
            multiplestackview.isHidden = false
            
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            
            multilabel1.text = answers[0].text
            multilabel2.text = answers[1].text
            multilabel3.text = answers[2].text
            multilabel4.text = answers[3].text
        }
        func updateRangedStack(using answers: [Answer]){
            rangestackview.isHidden = false
            
            rangedSlider.setValue(0.5, animated: false)
            
            rangedlabel1.text = answers.first?.text
            rangedlabel2.text = answers.last?.text
        }
        
    }
    @IBAction func singleAnsweButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case sButton1:
            answerChosen.append(currentAnswers[0])
        case sButton2:
            answerChosen.append(currentAnswers[1])
        case sButton3:
            answerChosen.append(currentAnswers[2])
        case sButton4:
            answerChosen.append(currentAnswers[3])
        default: break
        }
        
        nextQuestion( )
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswers[0])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers

        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    func nextQuestion( ){
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }else{
            performSegue(withIdentifier: "ResultSegue", sender: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answerChosen
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
