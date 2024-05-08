//
//  QuestionData.swift
//  testpersonality
//
//  Created by Alumno on 17/04/24.
//

import Foundation

struct Question{
    
    var text: String
    var type: ResponseType
    var answers: [Answer]

}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case bear = "🦁", unicorn = "🦄", dog = "🐶", turtle = "🐢"
    var definition: String {
        switch self {
        case .dog:
            return "Siempre dispuesto a dar amor incondicional y lealtad, el perro es un compañero fiel en tofas la aventuras."
        case.bear:
            return "El oso, con su fuerza imponente, representa la fortaleza y la resistencia en la naturaleza, su agilidad y astucia lo hacen dominante en su habitat, reflejando la escencia misma de la vida salvaje."
        case.unicorn:
            return "Envuelto en misterio y magia, el unicornio representa la belleza unica y la pureza, cautivando en su gracia y encanto."
        case.turtle:
            return "Con su paciencia infinita y su sabiduria tranquila, la tortuga avanza constantemente hacia sus metas, recordandonos que el exito llega paso a paso."
        
        }
    }
    
}
