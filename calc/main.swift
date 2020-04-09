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

var result: (value: Int?, position: Int) = (0,0)

if (args.count % 2 == 0) {
    print("Input error: incomplete expression")
    exit(1)
}

if (args.count == 1 && Int(args[0]) == nil) {
    print("Input error: input is not a number")
    exit(1)
}

for index in stride(from: 0, to: args.count - 2, by:2) {
    if Int(args[index]) == nil {
        print("Input error: input is not an integer")
        exit(1)
    }
}

if (args.count == 1) {
    print(Int(args[0])!)
}

if (args.count > 2) {
    while (args.count > 2) {
        
        (result.value, result.position) = Calculator(args:args).calculate()
        
        if (result.position == 0 && args.count == 3) {
            args = [String(result.value!)]
            
        } else if (result.position == 0 && args.count > 3) {
            args = [String(result.value!)] + args[result.position + 3...args.count - 1]
            
        } else if (result.position > 0 && result.position < args.count - 3) {
            args = Array(args[0...result.position - 1] + [String(result.value!)] + args[result.position + 3...args.count - 1])
            
        } else {
            args = args[0...result.position - 1] + [String(result.value!)]
        }
    }
    print (String(result.value!))
}
