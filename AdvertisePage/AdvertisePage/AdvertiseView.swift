//
//  AdvertiseView.swift
//  AdvertisePage
//
//  Created by 余亮 on 16/6/13.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit
import SnapKit

//let YLUserDefault = NSUserDefaults.standardUserDefaults
let adImageName = "adImageName"
let adUrl = "adUrl"

class AdvertiseView: UIView {
    var filePath : String?{
        didSet{
            adView.image = UIImage.init(contentsOfFile: filePath!)
            
        }
    }
    
    var countTimer : NSTimer?
    
    var count : Int?{
        didSet{
            countBtn.setTitle("跳过" + "\(count)", forState: UIControlState.Normal)
            if (count == 0 ){
                self.countTimer?.invalidate()
                self.countTimer = nil
                self.dismiss()
            }
        }
    }
    var showTime : Int = 3

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
         countTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self , selector:#selector(AdvertiseView.countDown), userInfo: nil , repeats: true)
    }
    
    func setUpSubViews(){
        self.addSubview(adView)
        self.addSubview(countBtn)
        adView.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.top.equalTo(self.snp_top)
            make.bottom.equalTo(self.snp_bottom)
        }
        
        countBtn.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(30)
            make.right.equalTo(self.snp_right).offset(-60)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(){
        //倒计时方法
//        startCountDown()
        //倒计时方法
        startTimer()
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(self)
    }
    
    func startTimer(){
        count = showTime
        if let timer = self.countTimer {
            NSRunLoop.mainRunLoop().addTimer(timer, forMode:NSRunLoopCommonModes)
        
        }
    }
        
    func startCountDown(){
        var  timeout = showTime + 1
        let  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, dispatch_walltime(nil , 0), NSEC_PER_SEC, 0)  //每秒执行
        dispatch_source_set_event_handler(timer) { 
            if (timeout <= 0){  //倒计时结束，关闭
                dispatch_source_cancel(timer)
                dispatch_async(dispatch_get_main_queue(), { 
                    self.dismiss()
                })
            }else {
                dispatch_async(dispatch_get_main_queue(), { 
                    self.countBtn.setTitle("跳过" + "\(timeout)", forState: UIControlState.Normal)
                })
                timeout = (timeout - 1)
            }
        }
        dispatch_resume(timer)
    }
    
    func pushToAd(){
            dismiss()
        NSNotificationCenter.defaultCenter().postNotificationName("PUSHTOAD", object: nil )
    }
    
    func countDown(){
        count = count! - 1
        countBtn.setTitle("跳过"+"\(count)", forState: UIControlState.Normal)
        if (count == 0){
            self.countTimer?.invalidate()
            self.countTimer = nil
            dismiss()
        }
    }
    
    func dismiss(){
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0.000001
            }) { (finished) in
                 self.removeFromSuperview()
        }
    }
    
    //MARK: 懒加载
    private lazy var adView : UIImageView = {
        let view = UIImageView(frame:CGRectMake(0,0,100,100))
        view.userInteractionEnabled = true
        view.contentMode = .ScaleAspectFill
        view.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target:self , action:#selector(AdvertiseView.pushToAd))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private lazy var countBtn : UIButton = {
        let btn = UIButton(frame:CGRectMake(0,0,60,30))
        btn.addTarget(self , action:#selector(AdvertiseView.dismiss), forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitle("跳过" + "\(self.showTime)" , forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.RGBColor(38, G: 38, B: 38, A: 0.6)
        btn.layer.cornerRadius = 4
        btn.layer.masksToBounds = true
        return btn
    }()

}






































