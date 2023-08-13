//
//  ViewController.swift
//  Table View
//
//  Created by Berkay Kuzu on 8.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var allTeams: [[NeonAcademyPerson]] = []
    let sectionTitles: [String] = [ "IOS Team", "Android Team", "Design Team"]
    
    private let titanicTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviews()
        applyConstraints()
        titanicTable.dataSource = self
        titanicTable.delegate = self
        
        let iOSTeam = [
            NeonAcademyPerson(name: "Berkay", surname: "Kuzu", team: "iOS", age: 25, hometown: "Ankara", mail: "berkay@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Kamil", surname: "Çal", team: "iOS", age: 25, hometown: "İstanbul", mail: "kamil@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Mehmet", surname: "Arıkan", team: "iOS", age: 24, hometown: "Malatya", mail: "mehmet@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Recep", surname: "Akkoyun", team: "iOS", age: 21, hometown: "İstanbul", mail: "recep@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Osman", surname: "Urkaç", team: "iOS", age: 25, hometown: "İstanbul", mail: "osman@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Özgür", surname: "Mercan", team: "iOS", age: 27, hometown: "Diyarbakır", mail: "özgür@neonapps.com", isFavorite: false)
            ]
            
        let androidTeam = [
            NeonAcademyPerson(name: "Emre", surname: "Özel", team: "Android", age: 23, hometown: "Kars", mail: "emre@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Atilla", surname: "Eren", team: "Android", age: 28, hometown: "Malatya", mail: "atilla@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Fatih", surname: "Yılmaz", team: "Android", age: 29, hometown: "Samsun", mail: "fatih@neonapps.com", isFavorite: false)
            ]
            
        let designTeam = [
            NeonAcademyPerson(name: "Ezgi", surname: "Kahraman", team: "Design", age: 26, hometown: "Bursa", mail: "ezgi@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "İpek", surname: "Yılmaz", team: "Design", age: 24, hometown: "İstanbul", mail: "ipek@neonapps.com", isFavorite: false),
            NeonAcademyPerson(name: "Dilek", surname: "Soy", team: "Design", age: 24, hometown: "Artvin", mail: "dilek@neonapps.com", isFavorite: false)
            ]
        
        allTeams = [iOSTeam, androidTeam, designTeam]
    }

    private func addSubviews() {
        view.addSubview(titanicTable)
    }
    
    private func applyConstraints() {
        titanicTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return allTeams.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTeams[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        let neonAcademyPerson = allTeams[indexPath.section][indexPath.row]
            cell.textLabel?.text = "\(neonAcademyPerson.name) \(neonAcademyPerson.surname)"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.selectionStyle = .none
            //cell.textLabel?.textColor = .red
            cell.detailTextLabel?.text = neonAcademyPerson.team
            return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitles = sectionTitles[section]
        return sectionTitles
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let neonAcademyPerson = allTeams[indexPath.section][indexPath.row]
            let detailViewController = DetailViewController(neonAcademyPerson: neonAcademyPerson)
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (action, indexPath) in
                self?.allTeams[indexPath.section].remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            return [deleteAction]
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                allTeams[indexPath.section].remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completion) in
            self.allTeams[indexPath.section][indexPath.row].isFavorite = true
            completion(true)
            self.makeAlert(titleInput: "Favorite Added", messageInput: "You added your item successfully")
        }
        favoriteAction.backgroundColor = .systemBlue
                
        let configuration = UISwipeActionsConfiguration(actions: [favoriteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, view, completion) in
                let item = self.allTeams[indexPath.section][indexPath.row]
                let neonAcademyPerson = self.allTeams[indexPath.section][indexPath.row]
                let shareText = "Check out this person: \(neonAcademyPerson.name ) \(neonAcademyPerson.surname)"
                let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                self.present(activityViewController, animated: true, completion: nil)
                completion(true)
            }
            
            shareAction.backgroundColor = .systemGreen
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completion) in
                self?.allTeams[indexPath.section].remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
                self?.makeAlert(titleInput: "Deleted", messageInput: "You deleted the item successfully")
            }
            deleteAction.backgroundColor = .red
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
                configuration.performsFirstActionWithFullSwipe = false
                return configuration
            
        }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.purple
            
            let titleLabel = UILabel()
            titleLabel.text = sectionTitles[section]
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            titleLabel.textColor = UIColor.white
            headerView.addSubview(titleLabel)
            
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.top).offset(8)
            make.leading.equalTo(headerView.snp.leading).offset(16)
            make.bottom.equalTo(headerView.snp.bottom).offset(-8)
        }
            return headerView
        }
        
    }

