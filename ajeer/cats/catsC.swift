//
//  catsC.swift
//  ajeer
//
//  Created by Ahmed on 8/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class catsC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var lst: UICollectionView!

    var cnames = [String]()
    var cids = [Int]()
    var cfav = [Int]()
    var cpics = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCats()
        lst.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        chngHdr("الرئيسية",false)
    }
    
    func getCats(){
        cnames.removeAll()
        cpics.removeAll()
        cfav.removeAll()
        cids.removeAll()
        Alamofire.request("\(constats.api_link)home", method: .post, parameters: ["lang":"ar","user_id":user.id], encoding: JSONEncoding.default)
            .responseJSON { (response) in
                print(response)
                if let res = response.result.value {
                    if let arr = res as? NSArray {
                        for d in arr {
                            if let d2 = d as? NSDictionary {
                                self.cnames.append(d2["name"] as! String)
                                self.cids.append(d2["id"] as! Int)
                                self.cfav.append(d2["star"] as! Int)
                                self.cpics.append(d2["img"] as! String)
                            }
                        }
                    }
                }
                self.lst.reloadData()
        }
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = lst.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! catCell
        let inx = indexPath.row
        cell.cname.text = cnames[inx]
        
        let url = URL(string: "\(constats.baseUrl)\(cpics[inx])")
        cell.cpic.kf.indicatorType = .activity
        cell.cpic.kf.setImage(with: url)
     
        if cfav[inx] == 1{
            cell.cfav.image = UIImage(named: "favourite_filled")
        }else{
            cell.cfav.image = UIImage(named: "favourite_outline")
        }
        
        cell.btn.tag = cids[inx]
        
        cell.transform = CGAffineTransform(scaleX: -1, y: 1)

        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (lst.frame.width - 10)/3, height: 150)
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let inx = indexPath.row
        user.cat_id = cids[inx]
        user.cat_name = cnames[inx]
        govc("scatsv")
    }
}
