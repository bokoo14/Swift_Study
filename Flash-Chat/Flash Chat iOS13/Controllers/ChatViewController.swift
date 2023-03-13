//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    // reference to a database
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello!"),
        Message(sender: "1@2.com", body: "What's up!")
    ]
    
    // when user login, load a ChatViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        // load a saved message in firebase
        loadMessages()
    }
    
    // clear the dummy messages and reload messages from firebase
    func loadMessages() {
        // read data realtime and order by "date"
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener{ (querySnapshot, error) in
                
            // clear the dummy messages
            self.messages = []
            
            if let e = error { //optional error: if the error is exists
                print("There was an issue retrieving data from Firestore. \(e)")
            }
            else{ // when error not exists
                // load a data from a firebase and print: e.g. ["body": hello, "sender": 1@2.com]
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data() // get the saved date from firebase
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            
                            self.messages.append(newMessage)
                            
                            
                            // dispatch in main queue
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            // when press send button, send the current document to the firebase
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender,
                                                                      K.FStore.bodyField: messageBody,
                                                                      K.FStore.dateField: Date().timeIntervalSince1970
                                                                     ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                }
                else{ //if user complete saving date
                    print("Successfully saved data")
                    self.messageTextfield.text = ""
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            // logout
            try Auth.auth().signOut()
            
            // navigate to the WelcomeViewController
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    // how many table will show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        
        // identify the two user -> ImageView and textColor
        // this is a message from the current user
        // user1: 1@2.com 123456 user2: a@b.com 123456
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true // disable view leftImageView
            cell.rightImageView.isHidden = false // able view righrImageView
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple) // change the messageBubble
            cell.label.textColor = UIColor(named: K.BrandColors.purple) // change the label textColor
        }
        // this is a message from the another sender
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
    
        return cell
    }
}


// give the delegate to the ChatViewController
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

