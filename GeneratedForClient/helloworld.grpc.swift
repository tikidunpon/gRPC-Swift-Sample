//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: helloworld.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf

internal protocol Greeter_GreeterSayHelloCall: ClientCallUnary {}

fileprivate final class Greeter_GreeterSayHelloCallBase: ClientCallUnaryBase<Greeter_HelloRequest, Greeter_HelloReply>, Greeter_GreeterSayHelloCall {
  override class var method: String { return "/greeter.Greeter/SayHello" }
}


/// Instantiate Greeter_GreeterServiceClient, then call methods of this protocol to make API calls.
internal protocol Greeter_GreeterService: ServiceClient {
  /// Synchronous. Unary.
  func sayHello(_ request: Greeter_HelloRequest) throws -> Greeter_HelloReply
  /// Asynchronous. Unary.
  func sayHello(_ request: Greeter_HelloRequest, completion: @escaping (Greeter_HelloReply?, CallResult) -> Void) throws -> Greeter_GreeterSayHelloCall

}

internal final class Greeter_GreeterServiceClient: ServiceClientBase, Greeter_GreeterService {
  /// Synchronous. Unary.
  internal func sayHello(_ request: Greeter_HelloRequest) throws -> Greeter_HelloReply {
    return try Greeter_GreeterSayHelloCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func sayHello(_ request: Greeter_HelloRequest, completion: @escaping (Greeter_HelloReply?, CallResult) -> Void) throws -> Greeter_GreeterSayHelloCall {
    return try Greeter_GreeterSayHelloCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

class Greeter_GreeterServiceTestStub: ServiceClientTestStubBase, Greeter_GreeterService {
  var sayHelloRequests: [Greeter_HelloRequest] = []
  var sayHelloResponses: [Greeter_HelloReply] = []
  func sayHello(_ request: Greeter_HelloRequest) throws -> Greeter_HelloReply {
    sayHelloRequests.append(request)
    defer { sayHelloResponses.removeFirst() }
    return sayHelloResponses.first!
  }
  func sayHello(_ request: Greeter_HelloRequest, completion: @escaping (Greeter_HelloReply?, CallResult) -> Void) throws -> Greeter_GreeterSayHelloCall {
    fatalError("not implemented")
  }

}
