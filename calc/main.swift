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

var result: (value: Int?, position: Int) = (0,0) // stores the value and position of the result

//checks if the arguments are complete
if (args.count % 2 == 0) {
    print("Input error: incomplete expression")
    exit(1)
}

// checks if input is singular
if (args.count == 1) {
    print(Int(args[0])!)
}

// keeps iterating through args array until calculation is complete
if (args.count > 2) {
    while (args.count > 2) {
        
        (result.value, result.position) = Calculator(args:args).calculate()
        
        //calculation is complete :: no more iterations
        if (result.position == 0 && args.count == 3) {
            args = [String(result.value!)]
            
        // removes the first pair of ints with highest operator precedence from the array and replaces it with the result
            
        // if result is on the left
        } else if (result.position == 0 && args.count > 3) {
            args = [String(result.value!)] + args[result.position + 3...args.count - 1]
        // if result is in the middle
        } else if (result.position > 0 && result.position < args.count - 3) {
            args = Array(args[0...result.position - 1] + [String(result.value!)] + args[result.position + 3...args.count - 1])
        // if result is on the right
        } else {
            args = args[0...result.position - 1] + [String(result.value!)]
        }
    }
    // print final result
    print (String(result.value!))
}
