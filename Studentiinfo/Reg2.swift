//
//  Reg2.swift
//  Studentiinfo
//
//  Created by yashn on 21/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Reg2: UIViewController {

    @IBOutlet weak var Sname: UITextField!
    @IBOutlet weak var branch: UITextField!
    @IBOutlet weak var mobilen: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var emailId: UITextField!
    
    
    var ref : DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func SubmitReg2(_ sender: UIButton) {
        self.ref.child(Sname.text!).childByAutoId().setValue(["Name":Sname.text,"Branch":branch.text,"Mobile":mobilen.text,"Address":address.text,"Email":emailId.text])
            print("Reg 2 done sucessfully")
            clear()
    }
    
    
    func clear(){
        Sname.text = ""
        branch.text = ""
        mobilen.text = ""
        address.text = ""
        emailId.text = ""
      
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
