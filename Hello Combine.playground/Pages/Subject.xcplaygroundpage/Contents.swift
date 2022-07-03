import Foundation
import Combine

// PassthroughSubject<Output, False>
// output 타입과 False(error) 타입 설정
// Never => 실패할 일이 없다.
let relay = PassthroughSubject<String, Never>()
let subscripttion1 = relay.sink { value in
    print("subscription1 received value: \(value)")
}

relay.send("Hello")
relay.send("World!")


// CurrentValueSubject
// Outvalue에 대한 초기값을 넣어주어야 한다. ("")로 넣어주어도 무방
let variable = CurrentValueSubject<String, Never>("A")  // 초기값 "A"

variable.send("Initial text")   // 초기값 재설정

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}

variable.send("More text")

let publisher = ["Here", "We", "Go"].publisher
publisher.subscribe(relay)

