//
//  AppDelegate.swift
//  gRPC-Server-Sample
//
//  Created by koichi.tanaka on 2018/05/06.
//  Copyright © 2018年 koichi.tanaka. All rights reserved.
//

import Cocoa
import SwiftGRPC

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        gRPC.initialize()
        print("GRPC version", gRPC.version)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

