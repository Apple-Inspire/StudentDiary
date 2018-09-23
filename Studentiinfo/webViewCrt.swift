//
//  webViewCrt.swift
//  Studentiinfo
//
//  Created by yashn on 21/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import WebKit

class webViewCrt: UIViewController, WKUIDelegate , WKNavigationDelegate {
    
    
    @IBOutlet weak var webview: WKWebView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewq()
        //loadView()
        
        
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func webViewq()
    {
        let url = URL(string: "https://en.wikipedia.org/wiki/G._H._Raisoni_College_of_Engineering_Nagpur")!
        webView.load(URLRequest(url: url))
        
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(getter: webView.canGoBack))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
        
        
    }
    
    
    
    
    
    override func loadView() {
        
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        
        
        
        
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
