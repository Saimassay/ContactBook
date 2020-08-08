//
//  ContactViewController.swift
//  Contact-Book
//
//  Created by Gulnara Saimassay on 7/28/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects(){
        self.fetch{(complete) in
            if complete{
                if contacts.count >= 1{
                    tableView.isHidden = false
                } else{
                    tableView.isHidden = true
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactTableViewCell
        let contact = contacts[indexPath.row]
        cell?.configureCell(contacts: contact)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            let index = (tableView?.indexPathForSelectedRow?.row)!
            let destination = segue.destination as? DetailViewController
            destination?.detail_name = contacts[index].name_surname
            destination?.detail_phone_number = String(describing: contacts[index].phoneNumber)
            destination?.detail_image = contacts[index].image
        } 
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.removeContact(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print("row deleted")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        do{
            contacts = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data")
            completion(true)
        }catch{
            debugPrint("cannot fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeContact(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(contacts[indexPath.row])
        do{
            try managedContext.save()
            print("removed Contact")
        }catch{
            debugPrint("can not remove goal: \(error.localizedDescription)")
        }
    }
        
    }


