//
//  ViewController.swift
//  InfoAppCoreData
//
//  Created by Berkay Kuzu on 27.06.2023.
//

import UIKit
import CoreData

var infoItemList = [InfoItem]()

class ViewController: UIViewController {
    
    var firstLoad = true
    
    private let infoAppTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
//        table.backgroundColor = .orange
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(firstLoad) {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "InfoItem")
            
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let infoItem = result as! InfoItem
                    infoItemList.append(infoItem)
                }
            } catch {
                print("Fetched failed")
            }
        }
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        infoAppTableView.delegate = self
        infoAppTableView.dataSource = self
        configureNavBar()
        addSubviews()
        applyConstraints()
        
        infoAppTableView.register(InfoAppTableViewCell.self, forCellReuseIdentifier: InfoAppTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        infoAppTableView.reloadData()
    }
    
    private func addSubviews() {
        view.addSubview(infoAppTableView)
    }
    
    private func applyConstraints() {
        infoAppTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.left.bottom.equalToSuperview()
        }
    }

    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        title = "Info App ℹ️"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(plusButtonTapped))
        ]
    }
    
    @objc private func plusButtonTapped() {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoAppTableViewCell.identifier, for: indexPath) as! InfoAppTableViewCell
        
        let infoItem: InfoItem!
        infoItem = infoItemList[indexPath.row]
        
        cell.nameLabel.text = infoItem.name
        cell.surnameLabel.text = infoItem.surname
        cell.emailLabel.text = infoItem.email
        cell.ageLabel.text = infoItem.age
        cell.othersLabel.text = infoItem.others
        
//        cell.backgroundColor = .systemYellow
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 130
        }
    
    
    
}
