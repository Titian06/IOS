//
//  ViewController.swift
//  ev1.1
//
//  Created by Alumno on 05/03/24.
//

import UIKit

var listOfWords = ["Buccaneer","swift", "glorious", "incandescent", "bug", "program"]

let incorrectMovesAllowed = 7

class ViewController: UIViewController {
    
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var letterButtons: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var currentgame: Game!
    
    func newRound(){
    if !listOfWords.isEmpty {
        let newWord = listOfWords.removeFirst()
        currentgame = Game(word: newWord,incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        //enableLetterButtons(true)
        updateUI()
    }else{
        //enableLetterButtons(false)
    }
    }
    
    
    
    func updateUI(){
        var letters = [String]()
        for letter in currentgame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        
        correctWordLabel.text = currentgame.formattedWord
        scoreLabel.text = "wins: \(totalWins), Losses: \(totalLosses) "
        treeImageView.image = UIImage(named: "Tree \(currentgame.incorrectMovesRemaining)")
    }
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.configuration!.title!
        let letter =  Character(letterString.lowercased())
        currentgame.playerGuessed(letter: letter)
        updateUI()
    }
    
    
    
    
}
