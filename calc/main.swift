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

var result: (value: Int!, position: Int) = (0,0)

if (args.count == 1){
    print(Int(args[0])!)
}

if (args.count > 2){
    while args.count > 2{
        (result.value, result.position) = Calculator(args:args).calculate()
        
        if(result.position && args == 3){
            return
        }
    }
}

print(result)
