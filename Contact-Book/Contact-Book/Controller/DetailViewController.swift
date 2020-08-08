//
//  DetailViewController.swift
//  Contact-Book
//
//  Created by Gulnara Saimassay on 7/28/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var detail_name: String?
    var detail_phone_number: String?
    var detail_image: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = detail_name
        phoneLabel.text = detail_phone_number
        if detail_image == "Female"{
            contactImageView.image = GenderImage.female.image
        }else if detail_image == "Male"{
            contactImageView.image = GenderImage.male.image
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteBtnWasPressed(_ sender: Any) {
//        guard let contactVC = storyboard?.instantiateViewController(identifier: "ContactViewController") as? ContactViewController else{return}
//        contactVC.removeContact(atIndexPath: contactVC.tableView.indexPathForSelectedRow!)
    }
    
    
    @IBAction func callBtnWasPressed(_ sender: Any) {
        let alert = UIAlertController(title: "You are calling", message: detail_name, preferredStyle: .alert)

               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true)
    }
}
