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

var string: [String] = args

var numberArray: [Int] = []
var operatorArray: [String] = []

for i in 0..<string.count {
    if (isNumber(index: i)){
        numberArray.append(Int(string[i])!)
    }
}

 func isNumber(index: Int) -> Bool {
    if ((Int(string[index])) != nil){
        return true
    } else {
        return false
    }
}

// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
//let no2 = args[2]; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.add(no1: 1, no2: 1);

print(result)
