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
    
    init (args: [String]) {
        
        // store the pair of integers and their operator in sequence
        num1 = Int(args[position])!
        op = args[position + 1]
        num2 = Int(args[position + 2])!
        
        // iterates through the array to find the first integer pair with highest operator precedence
        if (!opPrecedence()) {
            while (position < args.count-3 && !opPrecedence()) {
                position += 2
                num1 = Int(args[position])!
                op = args[position + 1]
                num2 = Int(args[position + 2])!
            }
            
            // no there are no operators with precedence, use the first set of integers
            if (position == args.count-3 && !opPrecedence()) {
                position = 0
                num1 = Int(args[0])!
                op = args[1]
                num2 = Int(args[2])!
            }
        }
    }
    
    func opPrecedence() -> Bool {
        switch op{
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
    
    // does the calculation function
    func calculate() -> (number: Int?, position: Int){
        
        //if division by 0
        if (op == "/" || op == "%") {
            if (num2 == 0){
                print("Divided by 0")
                exit(2)
            }
        }
        
        var result: Int
        
        switch op {
        case "+":
            result = num1 + num2
        case "-":
            result = num1 - num2
        case "x":
            result = num1 * num2
        case "/":
            result = num1 / num2
        case "%":
            result = num1 % num2
        default:
            print("Unexpected error")
            exit(3)
        }
        
        // if the result is out of bounds
        if (result > Int.max || result < Int.min) {
            print("Out of bounds")
            exit(4)
        }
        
        return(result, position)
    }
    
}
