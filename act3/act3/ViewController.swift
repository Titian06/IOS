//
//  ViewController.swift
//  act3
//
//  Created by Alumno on 07/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greenslider: UISlider!
    @IBOutlet weak var blureslider: UISlider!
    @IBOutlet weak var blackslider: UISlider!
    @IBOutlet weak var redslider: UISlider!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var displayview: UIView!
    
    var color:Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        color = Color(red: redslider.value, green: greenslider.value, blue: blureslider.value)
        display.text = color.getString()
        displayview.backgroundColor = color.getColor()
        
        
    }

    @IBAction func sliderchaanged(_ sender: UISlider) {
        if (sender.tag == 1){
            color.setRed(red: sender.value)
            display.text = color.getString()
            displayview.backgroundColor = color.getColor()
        }
        else if (sender.tag == 2){
            color.setgreen(green: sender.value)
            display.text = color.getString()
            displayview.backgroundColor = color.getColor()
        }
        else if (sender.tag == 3){
            color.setblue(blue: sender.value)
            display.text = color.getString()
            displayview.backgroundColor = color.getColor()
        }
                    
    }
    
}

