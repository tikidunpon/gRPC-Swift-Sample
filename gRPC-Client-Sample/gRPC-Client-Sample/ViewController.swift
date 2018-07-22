//
//  ViewController.swift
//  gRPC-Client-Sample
//
//  Created by koichi.tanaka on 2018/05/06.
//  Copyright © 2018年 koichi.tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var call: Greeter_GreeterSayHelloBiCall?
    var client: Greeter_GreeterServiceClient?

    @IBAction func sendAction(_ sender: Any) {
        var request = Greeter_HelloRequest()
        request.name = "koichi"
        let _ = try? self.call?.send(request) { (error) in
            if let error = error {
                print("error: \(error)")
            }
        }
        self.call?.waitForSendOperationsToFinish()
    }
    
    @IBAction func receiveAction(_ sender: Any) {
        let _ = try? self.call?.receive { (resultOrError) in
            if case let result?? = resultOrError.result {
                print(result)
            } else if let error = resultOrError.error {
                print(error)
            }
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        let _ = try? self.call?.closeSend()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let client = Greeter_GreeterServiceClient.init(address: "127.0.0.1:50051", secure: false)
//        var request = Greeter_HelloRequest()
//        request.name = "hello"
//        let ret = try? client.sayHello(request)
//        print("gRPC Server returns " + ret!.message)

        self.client = Greeter_GreeterServiceClient.init(address: "127.0.0.1:50051", secure: false)
        client?.channel.subscribe(callback: { (connectivityState) in
            print("connectivityState = \(connectivityState)")
        })
        
        self.call = try! self.client?.sayHelloBi { (result) in
            // 最終的なステータスコード等
            print("result.statusCode = \(result.statusCode)")
        }
    }
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

