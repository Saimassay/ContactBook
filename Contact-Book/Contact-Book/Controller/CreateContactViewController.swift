//
//  CreateContactViewController.swift
//  Contact-Book
//
//  Created by Gulnara Saimassay on 7/28/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import UIKit
import CoreData

class CreateContactViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    var genderPick: [String] = [String]()
    var genderData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderPick = ["Male", "Female"]

        genderPicker.delegate = self
        genderPicker.dataSource = self
        nameTextField.delegate = self
        phoneTextField.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderPick.count
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderPick[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderData = genderPick[row]
        print("!!!!!\(String(describing: genderData))")
        
    }

    @IBAction func saveContact(_ sender: Any) {
        if nameTextField.text != "" && phoneTextField.text != ""{
            self.saveContact{ (complete) in
                if complete{
                    navigationController?.popViewController(animated: true)
                    dismiss(animated: true, completion: nil)
                    print("Save button was pressed")
                }
            }
        } else{
            print("empty field")
        }
       
    }
    
    func saveContact(completion: (_ finished: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let contact = Contact(context: managedContext)
        contact.name_surname = nameTextField.text
        contact.phoneNumber = Int64(phoneTextField.text!)!
        contact.image = genderData
        
        do {
            try managedContext.save()
            print("Data saved")
            completion(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
