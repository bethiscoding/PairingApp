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
    
    var people: [Person]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions & Methods
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        presentAddPersonAlert()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        people.shuffle()
    }
    
    func separatePeople() {
        let pairs = stride(from: 0, to: people.endIndex, by: 2).map { (<#Int#>) -> T in
            <#code#>
        }
    }
    
    func createNewGroup() {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //End

// MARK: - Extensions

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
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addPersonAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
} //End
