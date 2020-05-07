//
//  tabsC.swift
//  ajeer
//
//  Created by Ahmed on 9/2/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import MapKit

class tabsC: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lst: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //change font for segment
        let font = UIFont(name: "ZahraArabic-Bold", size: 20.0)!
        segment.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        chngHdr(user.scat_name)
    }
    
    
    @IBAction func chk(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            map.isHidden = false
            hideV(v: [lbl,lst])
        case 1:
            lbl.isHidden = false
            hideV(v: [map,lst])
        default:
            lst.isHidden = false
            hideV(v: [map,lbl])
        }
    }
    
}
