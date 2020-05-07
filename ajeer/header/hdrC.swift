//
//  hdrC.swift
//  ajeer
//
//  Created by Ahmed on 8/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class hdrC: UIViewController {
    static var tile:String = ""
    static var back:Bool = false
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var btnBack: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver("chnghdr", #selector(chngHdrName))
    }
    
    
    @objc func chngHdrName(){
        lblname.text = hdrC.tile
        btnBack.isHidden = !hdrC.back
    }

    @IBAction func back(){
        navigationController?.popViewController(animated: true)
    }
}
