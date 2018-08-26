//
//  GreeterProvider.swift
//  gRPC-Server-Sample
//
//  Created by koichi.tanaka on 2018/05/06.
//  Copyright © 2018年 koichi.tanaka. All rights reserved.
//

import Foundation
import SwiftGRPC

final class GreeterProvider: Greeter_GreeterProvider {
    func sayHello(request: Greeter_HelloRequest, session: Greeter_GreeterSayHelloSession) throws -> Greeter_HelloResponse {
        var g = Greeter_HelloResponse()
        g.text = request.text + " world"
        return g
    }
    
    func sayHelloBi(session: Greeter_GreeterSayHelloBiSession) throws -> ServerStatus? {
        var count = 0
        while true {
            do {
                guard let request = try session.receive()
                    else { break }  // End of stream
                var response = Greeter_HelloResponse()
                response.text = "Swift echo update (\(count)): \(request.text)"
                count += 1
                try session.send(response) {
                    if let error = $0 {
                        print("update error: \(error)")
                    }
                }
            } catch {
                print("update error: \(error)")
                break
            }
        }
        return .ok
    }
}
