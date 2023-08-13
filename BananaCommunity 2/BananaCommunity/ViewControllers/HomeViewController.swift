//
//  HomeViewController.swift
//  BananaCommunity
//
//  Created by Berkay Kuzu on 22.06.2023.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

class HomeViewController: UIViewController {
    
    //    var userEmailArray = [String]()
    //    var userCommentArray = [String]()
    //    var userImageArray = [String]()
    
    var firebaseDatas: [FirebaseData] = []

    let refreshControl = UIRefreshControl()
    
    let appCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 20
        flowlayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.collectionViewLayout = flowlayout
        collectionView.isPagingEnabled = true
        collectionView.refreshControl?.isContextMenuInteractionEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        //collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        //configureNavBar()
        getDataFromFirebase()
        
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        appCollectionView.addSubview(refreshControl)
        
        appCollectionView.register(BananaCollectionViewCell.self, forCellWithReuseIdentifier: BananaCollectionViewCell.identifier)
    }
    
    private func getDataFromFirebase() {
        
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error relating database")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.firebaseDatas.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        
                        let documentID = document.documentID
                        
                        if let postedBy = document.get("postedBy") as? String {
                            print(postedBy)
                            if let postComment = document.get("postComment") as? String {
                                print(postComment)
                                if let imageUrl = document.get("imageUrl") as? String {
                                    print(imageUrl)
                                    
                                    let firebaseData = FirebaseData(userName: postedBy, userComment: postComment, userImage: imageUrl, id: documentID)
                                    print(documentID)
                                    self.firebaseDatas.append(firebaseData)
                                }
                            }
                        }
                    self.appCollectionView.reloadData()
                    }
                }
            }
        }
        
        
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Main Page", style: .done, target: nil, action: nil)
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func addSubviews() {
        view.addSubview(appCollectionView)
    }
    
    private func applyConstraints() {
        appCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    
    @objc func refreshData() {
        refreshControl.endRefreshing()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firebaseDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BananaCollectionViewCell.identifier, for: indexPath) as! BananaCollectionViewCell
        
        let data = firebaseDatas[indexPath.item]
        cell.setup(with: data, navigationController: navigationController)
        
        // Shadow effect
        //        cell.layer.shadowColor = UIColor.black.cgColor
        //        cell.layer.shadowOpacity = 0.5
        //        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        //        cell.layer.shadowRadius = 4
        //        // cell corner radius and borderWidth
        //        cell.layer.borderColor = UIColor.gray.cgColor
        //        cell.layer.borderWidth = 1
        //        cell.layer.masksToBounds = true
        //        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        return CGSize(width: screenWidth, height: 350)
    }
    
    // MARK: - UIAlertController
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
