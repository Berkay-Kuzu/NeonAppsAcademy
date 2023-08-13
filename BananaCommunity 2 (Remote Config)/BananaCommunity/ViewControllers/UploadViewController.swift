//
//  UploadViewController.swift
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

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    var tapGesture: UITapGestureRecognizer!
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "click1.png")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let uploadLabel: UILabel = {
        let label = UILabel()
        label.text = "Please upload your photo!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 25)
        //label.isHidden = true
        return label
    }()
    
    private let uploadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Upload", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let commentTextView: UITextView = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        commentTextView.delegate = self
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        configureNavBar()
        gestureRecognizer()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to Second Page", style: .done, target: nil, action: nil)
    }
    
    private func addSubviews(){
        view.addSubview(iconImageView)
        view.addSubview(uploadLabel)
        view.addSubview(uploadButton)
        view.addSubview(commentTextView)
    }
    
    private func applyConstraints() {
        
        uploadLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(uploadLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.top.equalTo(commentTextView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        commentTextView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(24)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
            make.height.equalTo(100)
        }
        
    }
    
    private func gestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        iconImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        iconImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0, let firstCharacter = string.first {
            textField.text = String(firstCharacter.lowercased())
            return false
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    @objc private func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @objc private func uploadButtonTapped() {
        //Firebase Storage Processes
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        if let data = iconImageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { metaData, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error concerning image")
                } else {
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            guard let url = url else {return}
                            let imageUrl = url.absoluteString
                            
                            //Firebase Database
                            
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference: DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl": imageUrl, "postedBy": Auth.auth().currentUser!.email!, "postComment": self.commentTextView.text!, "date": FieldValue.serverTimestamp(), "likes": 0 ] as [String: Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                                } else {
                                    print(firestorePost)
                                    self.iconImageView.image = UIImage(named: "click1")
                                    self.commentTextView.text = ""
                                    if let tabBarController = self.tabBarController {
                                        UIView.transition(with: tabBarController.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                                            tabBarController.selectedIndex = 0
                                        }, completion: nil)
                                    }
                                }
                            })
                        }
                    }
                }
            }
        }
    }
    
    @objc func dismissKeyboard() {
        commentTextView.resignFirstResponder() // Klavyeyi kapat
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        view.addGestureRecognizer(tapGesture) // UITapGestureRecognizer'ı etkinleştir
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        view.removeGestureRecognizer(tapGesture) // UITapGestureRecognizer'ı devre dışı bırak
    }
    
    // MARK: - UIAlertController
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
}
