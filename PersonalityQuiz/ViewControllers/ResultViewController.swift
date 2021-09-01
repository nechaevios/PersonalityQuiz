//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Sergey Nechaev on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    var userAnswers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateBestMatch()
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func calculateBestMatch() {
        var answerAnimals: [Animal] = []
        
        userAnswers.forEach { answer in  answerAnimals.append(answer.animal) }
        
        let countedAnswers = answerAnimals.reduce(into: [:]) {
            animals, count in animals[count, default: 0] += 1
        }
        let countedAnswersSorted = countedAnswers.sorted { $0.value > $1.value }
        
        guard let maxValueAnimal = countedAnswersSorted.first?.key else { return }
        
        resultLabel.text = "Вы - \(maxValueAnimal.rawValue)"
        resultTextLabel.text = maxValueAnimal.definition
    }
}
