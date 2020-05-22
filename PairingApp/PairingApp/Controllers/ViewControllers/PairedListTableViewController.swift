//
//  PairedListTableViewController.swift
//  PairingApp
//
//  Created by Bethany Morris on 5/22/20.
//  Copyright © 2020 Bethany M. All rights reserved.
//

import UIKit

class PairedListTableViewController: UITableViewController {

    // MARK: - Properties
    
    var people = PersonController.sharedInstance.people
    var groups: [[Person]] {
        people.group(by: 2)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    // MARK: - Actions & Methods
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        presentAddPersonAlert()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        people.shuffle()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // logic for "complete" and "incomplete" headers
        return "Group \(section + 1)"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

        let person = groups[indexPath.section][indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            let person = groups[indexPath.section][indexPath.row]
            PersonController.sharedInstance.deletePerson(personToDelete: person)
            do {
                self.people = []
                self.people = PersonController.sharedInstance.people
                self.tableView.reloadData()
            }
        }
    }

} //End

// MARK: - Alert Controller

extension PairedListTableViewController {
    
    func presentAddPersonAlert() {
        let alertController = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Name..."
            textField.autocapitalizationType = .words
        }
        
        let addPersonAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let name = alertController.textFields?.first?.text, !name.isEmpty else { return }
            PersonController.sharedInstance.createPerson(name: name)
            
            do {
                self.people = []
                self.people = PersonController.sharedInstance.people
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addPersonAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
} //End
