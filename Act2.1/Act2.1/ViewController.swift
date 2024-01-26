//
//  ViewController.swift
//  Act2.1
//
//  Created by Alumno on 25/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numeroInput: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var numeroAleatorioLabel: UILabel!

    @IBAction func verificarNumero(_ sender: UIButton) {
        // Verificar si el usuario ingresó un número válido
        guard let numeroUsuario = Int(numeroInput.text ?? "") else {
            resultadoLabel.text = "Ingresa un número válido"
            resultadoLabel.backgroundColor = .clear
            return
        }

        // Generar un número aleatorio del 1 al 6
        let numeroAleatorio = Int.random(in: 1...6)

        // Mostrar el número aleatorio generado
        numeroAleatorioLabel.text = "\(numeroAleatorio)"

        // Verificar si el usuario acertó
        if numeroUsuario == numeroAleatorio {
            resultadoLabel.text = "¡Acertaste!"
            resultadoLabel.backgroundColor = UIColor.green
        } else {
            resultadoLabel.text = "Fallaste. Inténtalo de nuevo."
            resultadoLabel.backgroundColor = UIColor.red
        }
    }
}

