//
//  Calculator.swift
//  calc
//
//  Created by Rainier Limcangco on 5/4/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    var numberArray: [Int] = []
    var operatorArray: [String] = []
    
    init(numberArray:[Int], operatorArray:[String]){
        self.numberArray = numberArray
        self.operatorArray = operatorArray
    }
    
    
    var currentResult = 0;
    

    func Add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
        //if out of bounds throw error
    }
    
    func Subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func Multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func Divide(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func Modulus(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }
    
    func calculate(no1: Int, no2: Int, oper: String) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
        var result: Int;
        
        switch oper {
        case "+":
            result = Add(no1: no1, no2: no2)
            break
        case "-":
            result = Subtract(no1: no1, no2: no2)
            break
        case "x":
            result = Multiply(no1: no1, no2: no2)
            break
        case "/":
            result = Divide(no1: no1, no2: no2)
            break
        case "%":
            result = Modulus(no1: no1, no2: no2)
            break
        default:
            return "";
        }

        return(String(result))
    }
}
