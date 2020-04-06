//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

var inputString: [String] = args

var numberArray: [Int] = []
var operatorArray: [String] = []

for i in 0..<inputString.count {
    if (isNumber(index: i)){
        numberArray.append(Int(inputString[i])!)
    }
}

 func isNumber(index: Int) -> Bool {
    if ((Int(inputString[index])) != nil){
        return true
    } else {
        return false
    }
}

func isOperator(index:Int) -> Bool {
    switch inputString[index]{
    case "+", "-", "x", "/", "%":
        return true
        
    default:
         return false
        
    }
}

// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
//let no2 = args[2]; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator(numberArray: numberArray, operatorArray: operatorArray);

// Calculate the result
let result = calculator.Add(no1: 1, no2: 1);

print(result)
