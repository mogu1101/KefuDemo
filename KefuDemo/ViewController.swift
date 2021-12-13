//
//  ViewController.swift
//  KefuDemo
//
//  Created by Liu Jinjun on 2021/12/9.
//

import UIKit
import HelpDesk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button = UIButton(frame: .init(x: 0, y: 0, width: 100, height: 50))
        button.center = view.center
        button.setTitle("客服", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(gotoKefuPage), for: .touchUpInside)
        view.addSubview(button)
        
        let logoutButton = UIButton(frame: .init(x: 0, y: 0, width: 100, height: 50))
        logoutButton.center = CGPoint(x: view.centerX, y: view.centerY + 100)
        logoutButton.setTitle("退出", for: .normal)
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        view.addSubview(logoutButton)
    }

    @objc func gotoKefuPage() {
        if login(), let vc = ChatViewController(conversationChatter: "kefuchannelimid_495303") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func login() -> Bool {
        guard let client = HDClient.shared() else { return false }
        if client.isLoggedInBefore {
            return true
        }
        let username = "test"
        let password = "123456"
        
        func doLogin() -> Bool {
            if let error = client.login(withUsername: username, password: password) {
                print("用户登录错误：--------- \(error.code), \(error.errorDescription ?? "")")
                return false
            }
            print("用户登录成功")
            return true
        }
        
        if let error = client.register(withUsername: username, password: password) {
            if error.code == HDErrorUserAlreadyExist {
                print("用户注册错误：--------- HDErrorUserAlreadyExist")
                return doLogin()
            } else if error.code == HDErrorUserRegisterFailed {
                print("用户注册错误：--------- HDErrorUserRegisterFailed")
            } else {
                print("用户注册错误：--------- \(error.code), \(error.errorDescription ?? "")")
            }
            return false
        }
        return doLogin()
    }
    
    @objc func logout() {
        if let error = HDClient.shared().logout(true) {
            print("用户登出错误：--------- \(error.code), \(error.errorDescription ?? "")")
            return
        }
        print("用户登出成功")
    }
}
