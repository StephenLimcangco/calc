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
    var pos = 0
    
    init(args: [String]){
        
        if let unwrappednum1 = Int(args[pos]){
            num1 = unwrappednum1
        } else {
            exit(1)
        }
        
        if let unwrappednum2 = Int(args[pos]){
            num2 = unwrappednum2
        } else {
            exit(1)
        }
        
        op = args[num1 + 1]
        
        if !isOpPref(){
            choosePair(args:args)
        }
    }
    
    func choosePair(args: [String]){
        
        while pos < args.count-3 && !isOpPref(){
            pos += 2
            
            num1 = Int(args[pos])!
            op = args[pos + 1]
            num2 = Int(args[pos + 2])!
        }
        
        if pos == args.count-3 && !isOpPref(){
            pos = 0
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
            break
        case "-":
            result = num1 - num2
            break
        case "x":
            result = num1 * num2
            break
        case "/":
            result = num1 / num2
            break
        case "%":
            result = num1 % num2
            break
        default:
            result = 0
            //error message
        }
        return(result, pos)
    }
    
    func isOpPref() -> Bool {
        switch op{
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
}
