//
//  AdvertiseVC.swift
//  AdvertisePage
//
//  Created by 余亮 on 16/6/13.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

class AdvertiseVC: UIViewController {

    var adUrl : String?
    {
        didSet{
              adUrl = "http://www.jianshu.com"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "点击进入广告链接"
        self.view.addSubview(webV)
        
        if var  url = adUrl {
            url = "http://www.jianshu.com"
            let request = NSURLRequest(URL:NSURL(string:url)!)
            webV.loadRequest(request)
            self.view.addSubview(webV)
        
        }
//        if (adUrl!.isEmpty){
//        }
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

    private lazy var webV : UIWebView = {
        let view = UIWebView(frame:self.view.bounds)
        view.backgroundColor = UIColor.whiteColor()
        return view
    }()
    
  }
























