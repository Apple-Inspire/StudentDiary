//
//  welcome.swift
//  Studentiinfo
//
//  Created by YashN on 21/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import Firebase

class welcome: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableView1: UITableView!
    
    
    
    @IBOutlet weak var userdata: UILabel!
    let list = ["Registration" , "Attendance" ,"Website", "Contact","LogOut"]
    
    var prof: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.dataSource = self as? UITableViewDataSource
        tableView1.delegate = self as? UITableViewDelegate
        // Do any additional setup after loading the view.
        tableView1.isHidden = true
        
        let user = Auth.auth().currentUser
        if let user = user {
            let email = user.email
            userdata.text = email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(list.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        prof = indexPath.row
        if(prof == 0)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Reg2") as? Reg2
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 1)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "StudentAtd") as? StudentAtd
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 2)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "webViewCrt") as? webViewCrt
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 3)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "ContactUs") as? ContactUs
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        
        
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
      
    }
    
    var counterx: Int = 0
    
    @IBAction func bfb(_ sender: UIButton) {
        counterx = counterx+1
        if(counterx%2 == 0)
        {
            tableView1.isHidden = true
        }
        else{
            tableView1.isHidden = false
        }
    }
    
    
    
    
    @IBAction func Logout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        if let storyboard = self.storyboard {
            let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! Login
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    
    
    @IBAction func logOut(_ sender: Any) {
        
        try! Auth.auth().signOut()
        if let storyboard = self.storyboard {
            let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! Login
            self.present(vc, animated: false, completion: nil)
        }
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
