//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let label = Label()
let vm = SomeViewModel()
print("text: \(label.text)")

// 퍼블리셔($name)의 데이터를 label에 있는 text에 할당한다.
vm.$name.assign(to: \.text, on: label)
print("text: \(label.text)")

vm.name = "Jason"
print("text: \(label.text)")



//: [Next](@next)
