//
//  ViewController.swift
//  SearchBar
//
//  Created by Berkay Kuzu on 9.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var person: [NeonAcademyPerson] = []
    private lazy var selectedPerson: [NeonAcademyPerson] = []
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        return table
    }()
    
    private let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = .minimal
        bar.placeholder = "Search for a name"
        //bar.selectedScopeButtonIndex = 0
        return bar
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.layer.cornerRadius = 5
        segmentedControl.clipsToBounds = true
        segmentedControl.selectedSegmentTintColor = .systemPurple
        segmentedControl.insertSegment(withTitle: "Name", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Surname", at: 1, animated: true)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        //segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        setupData()
        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
    }
    
    private func setupData() {
        person.append(NeonAcademyPerson(name: "Berkay", surname: "Kuzu"))
        person.append(NeonAcademyPerson(name: "Kamil", surname: "Cal"))
        person.append(NeonAcademyPerson(name: "Mehmet", surname: "Arıkan"))
        person.append(NeonAcademyPerson(name: "Recep", surname: "Akkoyun"))
        person.append(NeonAcademyPerson(name: "Osman", surname: "Urkaç"))
        person.append(NeonAcademyPerson(name: "Ozgür", surname: "Mercan"))
        person.append(NeonAcademyPerson(name: "Emre", surname: "Ozel"))
        person.append(NeonAcademyPerson(name: "Atilla", surname: "Eren"))
        person.append(NeonAcademyPerson(name: "Ahmet", surname: "Ziya"))
        person.append(NeonAcademyPerson(name: "Serkan", surname: "Keskin"))
        person.append(NeonAcademyPerson(name: "Yavuz", surname: "Uzun"))
        person.append(NeonAcademyPerson(name: "İbrahim", surname: "Orta"))
        person.append(NeonAcademyPerson(name: "Mustafa", surname: "Sağlam"))
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(segmentedControl)
    }
    
    private func applyConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints { make in
            //make.edges.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            searchBar.placeholder = "Search by name"
            selectedPerson = person.sorted { $0.name < $1.name }
            tableView.reloadData()
        } else if sender.selectedSegmentIndex == 1 {
            searchBar.placeholder = "Search by surname"
            selectedPerson = person.sorted { $0.surname < $1.surname }
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        let user = selectedPerson[indexPath.row]
        cell.textLabel?.text = "\(user.name) \(user.surname)"
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        selectedPerson = person
        if !searchText.isEmpty {
            selectedPerson = selectedPerson.filter { $0.name.lowercased().starts(with: searchText.lowercased()) || $0.surname.lowercased().starts(with: searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}
