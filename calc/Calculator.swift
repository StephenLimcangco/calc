//
//  Calculator.swift
//  calc
//
//  Created by Rainier Limcangco on 5/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    var op: String
    var num1: Int
    var num2: Int
    var position = 0
    
    init(args: [String]){
        
        if let unwrappednum1 = Int(args[position]){
            num1 = unwrappednum1
        } else {
            exit(1)
        }
        
        op = args[position + 1]
        
        if let unwrappednum2 = Int(args[position + 2]){
            num2 = unwrappednum2
        } else {
            exit(1)
        }
        
        
        if !isOpPref(){
            choosePair(args:args)
        }
    }
    
    func choosePair(args: [String]){
        
        while position < args.count-3 && !isOpPref(){
            position += 2
            
            num1 = Int(args[position])!
            op = args[position + 1]
            num2 = Int(args[position + 2])!
        }
        
        if position == args.count-3 && !isOpPref(){
            position = 0
            num1 = Int(args[0])!
            op = args[1]
            num2 = Int(args[2])!
        }
    }

    func calculate() -> (number: Int?, position: Int){
        
        var result: Int
        
        switch op {
        case "+":
            result = num1 + num2
        case "-":
            result = num1 - num2
        case "x":
            result = num1 * num2
        case "/":
            if num2 == 0{
            exit(2)
            }
            result = num1 / num2
        case "%":
            if num2 == 0{
            exit(2)
            }
            result = num1 % num2
        default:
            exit(2)
        }
        
        if result > Int32.max || result < Int32.min {
            exit(2)
        }
        
        return(result, position)
    }
    
    func isOpPref() -> Bool {
        switch op{
        case "+", "-":
            return false
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
}
