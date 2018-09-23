//
//  StudentAtd.swift
//  Studentiinfo
//
//  Created by yashn on 21/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MapKit
import CoreLocation

class StudentAtd: UIViewController ,CLLocationManagerDelegate ,MKMapViewDelegate{

    @IBOutlet weak var SnameAtd: UITextField!
    @IBOutlet weak var RollNo: UITextField!
    @IBOutlet weak var dataTime: UILabel!
    
    
    @IBOutlet weak var LatView: UILabel!
    @IBOutlet weak var LonView: UILabel!
    @IBOutlet weak var MapView: MKMapView!
    
    var ref : DatabaseReference!
    
    //var manager: CLLocationManager!
    
    var Long:Double = 0.0
    var Latg:Double = 0.0
    
    
    let locationManager = CLLocationManager()
    //let weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        //let date = Date()
        //print(now)
        
        //dataTime.text! = date
        let now = Date()
        
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString = formatter.string(from: now)
        print(dateString)
        
        dataTime.text! = dateString
        
        
        
        //Map
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        // Update location lang and lattude
        LatView.text = String(Latg)
        LonView.text = String(Long)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func SubmitAtd(_ sender: UIButton) {
        
       
        LatView.text = String(Latg)
        LonView.text = String(Long)
        if(Long == 21.1070464 && Latg == 79.0033643)
        {
            self.ref.child(SnameAtd.text!).childByAutoId().setValue(["Name":SnameAtd.text,"RollNo":RollNo.text,"DateTime":dataTime.text,"LocationLat":LonView.text,"LocationLong":LatView.text])
            print("Student Attendence Marked")
            
        }
        else
        {
            print("Not marked")
        }
        
        
        
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        print(locValue.latitude)
        print(locValue.longitude)
        Long = locValue.latitude
        Latg = locValue.longitude
        
        
        //mapView1.setRegion(viewRegion, animated: false)
        
        // self.map.setRegion(UIRegion, animated: true)
        //return (locValue.latitude)
        
    }
    
    
    
    
    
    
}
