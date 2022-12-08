//
//  Deleted Code.swift
//  messangerApp
//
//  Created by Consultant on 12/7/22.
//


import UIKit
import MessageKit
import Firebase

 //MARK: ChatViewController

//struct Message: MessageType {
//    var sender: MessageKit.SenderType
//    var messageId: String
//    var sentDate: Date
//    var kind: MessageKit.MessageKind
//}
//
//struct Sender: SenderType {
//    var senderId: String
//    var displayName: String
//}
//
//class ChatViewController: MessagesViewController {
//
//    private var messages = [Message]()
//
//    private let selfSender = Sender(senderId: "1",
//                                    displayName: "Joe Smith")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        messages.append(Message(sender: selfSender,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind:  .text("Yerr whats good fam")))
//        messages.append(Message(sender: selfSender,
//                                messageId: "1",
//                                sentDate: Date(),
//                                kind:  .text("Yerr whats good fam?!? Im Boolin !!!!!")))
//
//        view.backgroundColor = .blue
//
//        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messagesLayoutDelegate = self
//        messagesCollectionView.messagesDisplayDelegate = self
//
//    }
//
//}
//
//extension ChatViewController : MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
//    func currentSender() -> MessageKit.SenderType {
//        return selfSender
//    }
//
//    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
//        return messages[indexPath.section]
//    }
//
//    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
//        return messages.count
//    }
//
//}
