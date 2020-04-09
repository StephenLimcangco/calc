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

 //print("test")

var result: (value: Int?, position: Int) = (0,0)


if(args.count % 2 == 0){
    
    print("incomplete expression")
       exit(2)
   }

       if (args.count == 1 && Int(args[0]) == nil) {
           print("non numerical input")
           exit(2)
           }

       for index in stride(from: 0, to: args.count - 2, by:2) {
           if Int(args[index]) == nil {

            print("non integer")
               exit(2)
           }
       }

if (args.count == 1){
      print(Int(args[0])!)
}


if (args.count > 2){
    
    while args.count > 2{

        (result.value, result.position) = Calculator(args:args).calculate()
    
        args = updateString( )
    }
    
    print (String(result.value!))
}


func updateString() -> [String] {
    
    if(result.position == 0 && args.count == 3){
        return [String(result.value!)]
        
    } else if (result.position == 0 && args.count > 3){
        return [String(result.value!)] + args[result.position + 3...args.count - 1]
        
    } else if (result.position > 0 && result.position < args.count - 3){
        return Array(args[0...result.position - 1] + [String(result.value!)] + args[result.position + 3...args.count - 1])
        
    } else {
        return args[0...result.position - 1] + [String(result.value!)]
        }
    }
