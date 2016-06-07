//
//  ViewController.swift
//  WCYArrowRectView
//
//  Created by wuchuanyu on 16/6/3.
//  Copyright © 2016年 wuchuanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arrowRectView = WCYArrowRectView(frame: CGRectMake(20, 40, 80, 100))
        arrowRectView.backgroundColor = UIColor.clearColor()
        arrowRectView.layer.shadowOffset = CGSizeMake(5, 5)
        arrowRectView.layer.shadowColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor
        arrowRectView.layer.shadowOpacity = 0.5
        self.view.addSubview(arrowRectView)
        
        let arrowRectView1 = WCYArrowRectView(frame: CGRectMake(140, 40, 80, 100))
        arrowRectView1.arrowPos = .TopRight
        arrowRectView1.arrowWidth = 16
        arrowRectView1.arrowHeight = 10
        arrowRectView1.backgroundColor = UIColor.clearColor()
        arrowRectView1.layer.shadowOffset = CGSizeMake(5, 5)
        arrowRectView1.layer.shadowColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).CGColor
        arrowRectView1.layer.shadowOpacity = 0.5
        self.view.addSubview(arrowRectView1)
        
        let arrowRectView2 = WCYArrowRectView(frame: CGRectMake(20, 160, 80, 100))
        arrowRectView2.arrowPos = .BottomLeft
        self.view.addSubview(arrowRectView2)
        
        let arrowRectView3 = WCYArrowRectView(frame: CGRectMake(140, 160, 80, 100))
        arrowRectView3.arrowPos = .BottomRight
        self.view.addSubview(arrowRectView3)
        
        let arrowRectView4 = WCYArrowRectView(frame: CGRectMake(20, 280, 80, 100))
        arrowRectView4.arrowPos = .LeftTop
        arrowRectView4.arrowWidth = 25
        arrowRectView4.arrowHeight = 10
        self.view.addSubview(arrowRectView4)
        
        let arrowRectView5 = WCYArrowRectView(frame: CGRectMake(140, 280, 80, 100))
        arrowRectView5.arrowPos = .LeftBottom
        arrowRectView5.arrowWidth = 25
        arrowRectView5.arrowHeight = 10
        arrowRectView5.fillColor = UIColor.grayColor()
        self.view.addSubview(arrowRectView5)
        
        let arrowRectView6 = WCYArrowRectView(frame: CGRectMake(20, 400, 80, 100))
        arrowRectView6.arrowPos = .RightTop
        arrowRectView6.arrowWidth = 25
        arrowRectView6.arrowHeight = 10
        arrowRectView6.corner = 10
        arrowRectView6.dotLineSpace = 0
        arrowRectView6.strokeWidth = 6
        arrowRectView6.strokeColor = UIColor.redColor()
        arrowRectView6.fillColor = UIColor(red: 219/255.0, green: 249/255.0, blue: 149/255.0, alpha: 1.0)
        self.view.addSubview(arrowRectView6)
        
        let arrowRectView7 = WCYArrowRectView(frame: CGRectMake(140, 400, 150, 100))
        arrowRectView7.arrowPos = .RightBottom
        arrowRectView7.arrowWidth = 25
        arrowRectView7.arrowHeight = 10
        arrowRectView7.arrowOffset = 37.5
        arrowRectView7.corner = 10
        arrowRectView7.dotLineSpace = 0
        arrowRectView7.strokeWidth = 0
        arrowRectView7.strokeColor = UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        arrowRectView7.fillColor = UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        self.view.addSubview(arrowRectView7)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

