//
//  AppDelegate.swift
//  KefuDemo
//
//  Created by Liu Jinjun on 2021/12/9.
//

import UIKit
import HelpDesk

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let option = HDOptions()
        option.appkey = "1464190306061767#kefuchannelapp24960"
        option.tenantId = "24960"
        let error = HDClient.shared().initializeSDK(with: option)
        if let error = error {
            debugPrint("环信客服初始化错误： \(error)")
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        return true
    }

}

