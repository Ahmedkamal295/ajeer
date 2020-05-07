//
//  ViewController.swift
//  ajeer
//
//  Created by Ahmed on 8/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire


extension UIView {
   @IBInspectable var corner:CGFloat {
        set{
            layer.cornerRadius = newValue
        }
        
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var border_width:CGFloat {
        set{
            layer.borderWidth = newValue
        }
        
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var border_color:UIColor? {
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
        get{
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
    }
    
    
}


extension UIViewController {
    func govc(_ id:String) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: id)
        //present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func alert(_ msg:String){
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "موافق", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func postNot(_ str:String){
        NotificationCenter.default.post(name: Notification.Name(str), object: nil)
    }
    
    func addObserver(_ str:String,_ selector:Selector){
        NotificationCenter.default.addObserver(self, selector: selector, name: Notification.Name("chnghdr"), object: nil)
    }
    
    func chngHdr(_ tile:String, _ back:Bool = true){
        hdrC.tile = tile
        hdrC.back = back
        postNot("chnghdr")
    }
    
    func saveUserData(){
        UserDefaults.standard.set(true, forKey: "loggedin")
        UserDefaults.standard.set(user.id, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }
    
    func showV(v:[UIView]){
        for i in v {
            i.isHidden = false
        }
    }
    
    func hideV(v:[UIView]){
        for i in v {
            i.isHidden = true
        }
    }
}

extension String {
    func toArabic() -> String {
        let numbersDictionary : Dictionary = ["0" : "۰","1" : "۱", "2" : "۲", "3" : "۳", "4" : "٤", "5" : "٥", "6" : "٦", "7" : "۷", "8" : "۸", "9" : "۹"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
}


//
class ViewController: UIViewController {
    override func viewDidLoad() {
        getUserData()
    }
    
    func getUserData(){
        let logged =  UserDefaults.standard.bool(forKey: "loggedin")
        if logged {
            govc("catsv")
        }else{
            govc("loginv")
        }
    }
}

