//
//  GreeterProvider.swift
//  gRPC-Server-Sample
//
//  Created by koichi.tanaka on 2018/05/06.
//  Copyright © 2018年 koichi.tanaka. All rights reserved.
//

import Foundation

final class GreeterProvider: Greeter_GreeterProvider {
    func sayHello(request: Greeter_HelloRequest, session: Greeter_GreeterSayHelloSession) throws -> Greeter_HelloResponse {
        var g = Greeter_HelloResponse()
        g.message = request.name + " world"
        return g
    }
}
