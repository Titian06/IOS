//
//  color.swift
//  act3
//
//  Created by Alumno on 08/02/24.
//

import UIKit

class Color{
    
    private var red:CGFloat
    private var green:CGFloat
    private var blue:CGFloat

    
    init (red:Float, green:Float, blue:Float){
        
        self.red = CGFloat(red)
        self.green = CGFloat(green)
        self.blue = CGFloat(blue)
        
        
    }
    
    func setRed(red:Float){
        
        self.red = CGFloat(red)
    }
    func setgreen(green:Float){
        
        self.green = CGFloat(green)
    }
    func setblue(blue:Float){
        
        self.blue = CGFloat(blue)
    }
    
    func getColor() -> UIColor{
        let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        
        return color
    }
    
    func getString() -> String{
        
        let string = " Red: \(Int(round(red)))\nGreen: \(Int(round(green)))\nBlue: \(Int(round(blue))) "
        return string

    }
    
}


