//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest -> 2개의 퍼블리셔를 합쳐서 같이 사용
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

// Publishers.CombineLatest(strPublisher, numPublisher).sink { value in} 이렇게도 가능
let combineL = strPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}

strPublisher.send("a")
strPublisher.send("b")
strPublisher.send("c")

// 2게의 퍼블리셔에 모두 값이 들어오지 않는다면 들어온 데이터만 최신화 될 뿐 실행되지 않음(출력불가)

numPublisher.send(1)
numPublisher.send(2)
numPublisher.send(3)

combineL.cancel()


// Advanced CombineLatest
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

// 회원가입 가능 유효사항 판별
let validatedCrendetialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential valid? : \(valid)")
    }

usernamePublisher.send("jasonLee")
passwordPublisher.send("weakpw")
passwordPublisher.send("strongPw123412341234")
validatedCrendetialsSubscription.cancel()

// Merge
// 두개의 퍼블리셔 합치기 단, 두개의 타입은 같아야 한다.
let publisher1 = [1, 2, 3, 4, 5].publisher
// let publisher2 = ["300", "400", "500"].publisher -> 에러 : 타입이 다르므로 불가
let publisher2 = [300, 400, 500].publisher

// Publishers.CombineLatest(publisher1, publisher2) 로도 가능
let mergePublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: Subscription received value: \(value)")
    }

//: [Next](@next)
