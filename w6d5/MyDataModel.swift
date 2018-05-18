//
//  MyDataModel.swift
//  w6d5
//
//  Created by Roland on 2018-05-17.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

import Foundation

struct MyDataModel {
    
    static func doSomething() {
        // Random number between -0.500 to +0.500
        let randomNumber = (Double(arc4random_uniform(1000)) - 500.0) / 1000.0
        
        // Sleep time between 0.5s to 1.5s
        let sleepTime = 1.0 + randomNumber
        
        // Sleep for 500ms to 1500ms
        let milliseconds = 1000.0
        let sleepTimeInMilliseconds = UInt32(sleepTime * milliseconds)
        usleep(sleepTimeInMilliseconds)
    }
}
