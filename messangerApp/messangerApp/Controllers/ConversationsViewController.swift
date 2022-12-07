//
//  ConversationsViewController.swift
//  messangerApp
//
//  Created by Consultant on 12/6/22.
//

import UIKit
import FirebaseAuth
import 

class ConversationsViewController: UIViewController {
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    
    private let noConversationLabel : UILabel = {
        let label = UILabel()
        label.text = "No Conversations!"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(tableview)
        view.addSubview(noConversationLabel)
        setupTableView()
        fetchConversations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //    private func validateAuth() {
    //        if FirebaseAuth.Auth.auth().currentUser == nil {
    //            let vc = LoginViewController()
    //            let nav = UINavigationController(rootViewController: vc)
    //            nav.modalPresentationStyle = .fullScreen
    //            present(nav, animated: false)
    //        }
    //    }
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func fetchConversations(){
        
        
    }
}

extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Yerrr, Whats Good?"
        return cell
    }
}
