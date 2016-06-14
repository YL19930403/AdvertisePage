//
//  ViewController.swift
//  AdvertisePage
//
//  Created by 余亮 on 16/6/13.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.mainScreen().bounds.width
let HEIGHT = UIScreen.mainScreen().bounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        NSNotificationCenter.defaultCenter().addObserver(self , selector: #selector(ViewController.pushToAd), name:"PUSHTOAD", object: nil )
    }

    func pushToAd(){
        let adVc =  AdvertiseVC()
        self.navigationController?.pushViewController(adVc, animated: true )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




























