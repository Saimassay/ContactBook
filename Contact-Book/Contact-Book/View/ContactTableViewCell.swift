//
//  ContactTableViewCell.swift
//  Contact-Book
//
//  Created by Gulnara Saimassay on 7/28/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(contacts: Contact){
        self.nameLabel.text = contacts.name_surname
        self.phoneLabel.text = String(describing: contacts.phoneNumber)
        //image
        if contacts.image == "Female"{
            self.contactImageView.image = GenderImage.female.image
        }else if contacts.image == "Male"{
            self.contactImageView.image = GenderImage.male.image
        }
        
        
    }

}
