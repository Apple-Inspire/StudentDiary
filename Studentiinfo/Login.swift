//
//  Login.swift
//  Studentiinfo
//
//  Created by Yash Nayak on 17/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import Firebase

class Login: UIViewController {
    var register: Register!
    @IBOutlet weak var loguname: UITextField!
    @IBOutlet weak var logpass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logbtn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: loguname.text!, password: logpass.text!) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
                print("Successful")
                self.clear()
                let regView = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as? welcome
                self.navigationController?.pushViewController(regView!, animated: true)
                
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
        }
    }
    
    func clear()
    {
        loguname.text = ""
        logpass.text = ""
    }
    
}
