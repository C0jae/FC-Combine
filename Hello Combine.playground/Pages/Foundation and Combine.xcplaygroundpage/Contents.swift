//: [Previous](@previous)

import Foundation
import Combine
import UIKit



// URLSessionTask Publisher and JSON Decoding Operator

URLSession.shared.dataTaskPublisher(for: URL(string: "www.google.com")!)
    .map { data, response in
        return data
    }
    .decode(type: <#T##Decodable.Protocol#>, decoder: <#T##TopLevelDecoder#>)


// Notifications





// KeyPath binding to NSObject instances



// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함


//: [Next](@next)
