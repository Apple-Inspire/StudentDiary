//
//  Register.swift
//  Studentiinfo
//
//  Created by Yash Nayak on 17/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Register: UIViewController {
    
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var branchfield: UITextField!
    @IBOutlet weak var rollfield: UITextField!
    @IBOutlet weak var unamefield: UITextField!
    @IBOutlet weak var passfield: UITextField!


    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func regbtn(_ sender: Any) {
 self.ref.child(namefield.text!).childByAutoId().setValue(["Name":namefield.text,"Branch":branchfield.text,"RollNumber":rollfield.text,"Uname":unamefield.text,"Password":passfield.text])
       
      Auth.auth().createUser(withEmail: unamefield.text!, password: passfield.text!, completion: {(user,error) in
        if error != nil {
            print(error!)
        } else {
            print("Successful")
            self.clear()
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as? welcome
            self.navigationController?.pushViewController(regView!, animated: true)
        }
      })
    }
    
    func clear(){
        namefield.text = ""
        branchfield.text = ""
        rollfield.text = ""
        unamefield.text = ""
        passfield.text = ""
    }
    
}

