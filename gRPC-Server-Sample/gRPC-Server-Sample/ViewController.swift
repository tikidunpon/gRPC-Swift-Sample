//
//  ViewController.swift
//  gRPC-Server-Sample
//
//  Created by koichi.tanaka on 2018/05/06.
//  Copyright © 2018年 koichi.tanaka. All rights reserved.
//

import Cocoa
import SwiftGRPC

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sem = DispatchSemaphore(value: 0)

        // Do any additional setup after loading the view.
        let greeterProvider = GreeterProvider()
        
        let greeterServer = Greeter_GreeterServer.init(address: "127.0.0.1:50051",
                                                       provider: greeterProvider)
        greeterServer.start()
        
        // This blocks to keep the main thread from finishing while the server runs,
        // but the server never exits. Kill the process to stop it.
        _ = sem.wait()
        // This suppresses a "variable echoServer was written to, but never read" warning.
        _ = greeterServer
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

