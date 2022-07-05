//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates => 반복되는 사항은 받지 않기
let words = "hey hey ther! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)
// .store(in: %a) a에 저장

// compactMap
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }   // Float 타입으로 변환이 가능한 것만, 가능하지 않는것은 nil 처리 -> nil 이면 값이 없으므로 적용이 안되는점 이용
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// ignoreOutput
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)


// prefix
let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)") }, receiveValue: { print($0)} )
    .store(in: &subscriptions)


//: [Next](@next)
