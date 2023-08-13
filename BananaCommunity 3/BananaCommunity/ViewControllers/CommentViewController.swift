//
//  CommentViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 22.06.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class CommentViewController: UIViewController {
    
    var comments: [Comment] = []
    var userID: String?
    
    private let bananaTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
//        table.backgroundColor = .orange
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        return table
    }()
    
    private var commentTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        //        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        textView.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Hafif soluk arka plan rengi
        textView.isScrollEnabled = true
        return textView
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        //        print(userID)
        bananaTableView.delegate = self
        bananaTableView.dataSource = self
        
        addSubviews()
        applyConstraints()
        
        configureNavBar()
        bananaTableView.reloadData()
        
        bananaTableView.register(BananaTableViewCell.self, forCellReuseIdentifier: BananaTableViewCell.identifier)
        
        getDataFromFirebaseFirestore()
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews() {
        view.addSubview(bananaTableView)
        view.addSubview(commentTextView)
        view.addSubview(sendButton)
    }
    
    private func applyConstraints() {
        bananaTableView.snp.makeConstraints { make in
            make.right.left.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-120)
        }
        
        commentTextView.snp.makeConstraints { make in
            make.top.equalTo(bananaTableView.snp.bottom).offset(8)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(50)
        }
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(commentTextView.snp.bottom).offset(8)
//            make.left.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        
    }
    
    func getDataFromFirebaseFirestore() {
        let fireStoreDatabase = Firestore.firestore()
        let currentUserId = Auth.auth().currentUser?.uid ?? ""
//        var userID: String?
        fireStoreDatabase.collection("Posts").document(userID ?? "").collection("Comments").addSnapshotListener { snapshot, error in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error relating database")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    self.comments.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        if let comment = document.get("comment") as? String {
                            print(comment)
                                if let userId = document.get("userID") as? String {
                                    print(userId)
                                    if let userName = document.get("userName") as? String {
                                        print(userName)
                                        
                                        let comment = Comment(userName: userName, userComment: comment)
                                        self.comments.append(comment)
                                    }
                            }
                        }
                        self.bananaTableView.reloadData()
                    }
                }
            }
        }
    }
    
    @objc private func sendButtonTapped(){
        print("sendButtonTapped")
        
        let commentTextViewText = commentTextView.text!
        
        if commentTextViewText != "" {
            
            let firestoreDatabase = Firestore.firestore()
            var firestoreReference: DocumentReference? = nil
            let userName = Auth.auth().currentUser!.email!
            let currentUserId = Auth.auth().currentUser?.uid ?? ""
            
            let commentData = [
                "userName": userName,
                "comment" : commentTextViewText,
                "userID" : currentUserId,
                "date": Date()
            ] as [String : Any]
            
            firestoreReference = firestoreDatabase.collection("Posts").document(userID ?? "").collection("Comments").addDocument(data: commentData, completion: { error in
                if let error = error {
                    self.makeAlert(titleInput: "Error!", messageInput: "Error adding document: \(error.localizedDescription)")
                } else {
                    print("Document added successfully")
                    self.commentTextView.text = ""
                }
            })
        } else {
            makeAlert(titleInput: "Error", messageInput: "Please write a comment!")
        }
        
    }
    
    // MARK: - UIAlertController
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }

}

extension CommentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BananaTableViewCell.identifier, for: indexPath) as! BananaTableViewCell
        let data = comments[indexPath.item]
        cell.setup(with: data)
        cell.selectionStyle = .none
        //cell.textLabel?.textColor = .red
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    
}
