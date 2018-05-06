//
//  ViewController.swift
//  gRPC-Client-Sample
//
//  Created by koichi.tanaka on 2018/05/06.
//  Copyright © 2018年 koichi.tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = Greeter_GreeterServiceClient.init(address: "127.0.0.1:50051", secure: false)
        var request = Greeter_HelloRequest()
        request.name = "hello"
        let ret = try? client.sayHello(request)
        print("gRPC Server returns " + ret!.message)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

