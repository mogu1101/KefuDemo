//
//  ChatViewController.swift
//  KefuDemo
//
//  Created by Liujinjun on 2021/12/12.
//

import UIKit

class ChatViewController: HDMessageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let visitorInfo = HDVisitorInfo()
        visitorInfo.nickName = "我是一个小南瓜"
        self.visitorInfo = visitorInfo
        
        showRefreshHeader = true
        delegate = self
        dataSource = self
        
        tableViewDidTriggerHeaderRefresh()
        
        HDClient.shared().chatManager.bindChat(withConversationId: conversation.conversationId)
        
        HDClient.shared().leaveMsgManager.getWorkStatusWith(toUser: conversation.conversationId, completion: nil)
    }
    
    deinit {
        HDClient.shared().chatManager.unbind()
    }

}

extension ChatViewController: HDMessageViewControllerDelegate {
//    func messageViewController(_ tableView: UITableView!, cellFor messageModel: HDIMessageModel!) -> UITableViewCell! {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "123")
//        cell.textLabel?.text = "12345"
//        return cell
//    }
}

extension ChatViewController: HDMessageViewControllerDataSource {
    
}
