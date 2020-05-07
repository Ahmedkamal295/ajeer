//
//  ViewController.swift
//  ajeer
//
//  Created by Ahmed on 8/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire

//
class loginC: UIViewController {
    
    
    @IBOutlet weak var txtnum: UITextField!
    @IBOutlet weak var txtcode: UITextField!
    @IBOutlet weak var txtpass: UITextField!
    
    
    @IBAction func login(_ sender: Any) {
        goLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chngHdr("تسجيل الدخول",false)
    }
    
    
    
    func goLogin(){
        Alamofire.request("\(constats.api_link)log-in/ar", method: .post, parameters: ["phone":"\(txtcode.text!)\(txtnum.text!)","password":txtpass.text!], encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response)
                if let res = response.result.value {
                    if let d = res as? NSDictionary {
                        let valid = d["valid"] as! Int
                        switch valid {
                        case 0:
                            self.alert(d["msg"] as! String)
                            
                        default:
                            user.id = d["user_id"] as! Int
                            print("user.id= \(user.id)")
                            self.saveUserData()
                            self.govc("catsv")
                        }
                        
                    }
                }
                
        }
    }
    
  
    
}

