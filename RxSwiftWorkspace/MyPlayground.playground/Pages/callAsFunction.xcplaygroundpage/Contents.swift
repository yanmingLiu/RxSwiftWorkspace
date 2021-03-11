//: [Previous](@previous)

import Foundation
import UIKit

struct Adder {
    let value: Int
    func callAsFunction(_ input: Int) -> Int {
      return input + value
    }
}

let add2 = Adder(value: 2)
let result = add2(1)
print(result)


public class Delegate<Input, Output> {
    // ...
    
    func callAsFunction(_ input: Input) -> Output? {
        return block?(input)
    }
}

class TextInputView: UIView {
    @IBAction func confirmButtonPressed(_ sender: Any) {
        onConfirmInput(inputTextField.text)
    }
}

let onReturnOptional = Delegate<Int, Int?>()
let value = onReturnOptional.call(1)
print(value)

//: [Next](@next)
