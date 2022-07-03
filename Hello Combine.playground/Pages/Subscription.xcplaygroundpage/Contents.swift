//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()

let subscription = subject
    .print("[Debug]")
    .sink { value in
    print("Subscriber received value: \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")

// subject 와 publisher의 관계 끊기
// subject에서 끊기(차단?)
//subject.send(completion: .finished)

// subscription에서 끊기(구독취소)
subscription.cancel()

subject.send("Hello ?? :(") // 연결안됨


// The print() operator prints you all lifecycle events


//: [Next](@next)
