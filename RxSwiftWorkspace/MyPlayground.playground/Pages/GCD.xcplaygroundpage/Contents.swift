//: [Previous](@previous)

import UIKit
import Foundation

let myQueue = DispatchQueue(label: "com.myapp.myq")

let block = DispatchWorkItem {
    for i in 0 ... 3 {
        print(i)
        sleep(1)
    }
}

/* thread one */
func beginWork() {
    myQueue.async(execute: block)
    
}

/* thread two */
func waitForWorkToFinish() {
    block.wait()
    print("finish")
}

beginWork()
waitForWorkToFinish()

//: [Next](@next)
