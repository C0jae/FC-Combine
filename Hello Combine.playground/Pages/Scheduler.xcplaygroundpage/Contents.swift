//: [Previous](@previous)

import Foundation
import Combine

// 퍼블리셔 생성
let arrPublisher = [1, 2, 3].publisher

// 커스텀큐 생성
let queue = DispatchQueue(label: "custom")

let subscription = arrPublisher
    .subscribe(on: queue)   // 무거운 작업은 다른곳으로 옮긴 후 진행
    .map({ value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    })
    .receive(on: DispatchQueue.main)    // 진행된 작업의 결과를 가져오기
    .sink { value in
    print("Receive Value: \(value), thread: \(Thread.current)")
}

