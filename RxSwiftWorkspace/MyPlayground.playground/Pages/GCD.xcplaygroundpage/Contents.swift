//: [Previous](@previous)

import Foundation

let d = Date().timeIntervalSince1970

print(d)


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
