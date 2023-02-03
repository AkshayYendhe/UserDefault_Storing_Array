//
//  ViewController.swift
//  UserDefault_Storing_Array
//
//  Created by Akshay Yendhe on 25/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var myStatusLabel: UILabel!
    
    var userArray = [String]()
   
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.temporaryDirectory)
        
        if let data = UserDefaults().object(forKey: nameTextField.text!) as? [String] {
            
            userArray = data
            myStatusLabel.text = "\(userArray.count) user's found."
            
        }
        else{
            myStatusLabel.text = "User Not Found!"
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        if let email = nameTextField.text ,let pass = ageTextField.text, let password = Int(pass), (!email.isEmpty && !pass.isEmpty)  {
            userArray = ["\(email)","\(password)"]
            UserDefaults().set(userArray, forKey: "\(email)")
            myTable.reloadData()
            myStatusLabel.text = "New User Added!"
            nameTextField.text = ""
            ageTextField.text = ""
        }
        else{
            myStatusLabel.text = "Kindly Enter Email & Password"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = userArray[indexPath.row]
        return cell
    }
    
}

