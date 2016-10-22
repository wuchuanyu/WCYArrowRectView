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
        let arrowRectView = WCYArrowRectView(frame: CGRect(x: 20, y: 40, width: 80, height: 100))
        arrowRectView.backgroundColor = UIColor.clear
        arrowRectView.layer.shadowOffset = CGSize(width: 5, height: 5)
        arrowRectView.layer.shadowColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).cgColor
        arrowRectView.layer.shadowOpacity = 0.5
        self.view.addSubview(arrowRectView)
        
        let arrowRectView1 = WCYArrowRectView(frame: CGRect(x: 140, y: 40, width: 80, height: 100))
        arrowRectView1.arrowPos = .topRight
        arrowRectView1.arrowWidth = 16
        arrowRectView1.arrowHeight = 10
        arrowRectView1.backgroundColor = UIColor.clear
        arrowRectView1.layer.shadowOffset = CGSize(width: 5, height: 5)
        arrowRectView1.layer.shadowColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0).cgColor
        arrowRectView1.layer.shadowOpacity = 0.5
        self.view.addSubview(arrowRectView1)
        
        let arrowRectView2 = WCYArrowRectView(frame: CGRect(x: 20, y: 160, width: 80, height: 100))
        arrowRectView2.arrowPos = .bottomLeft
        self.view.addSubview(arrowRectView2)
        
        let arrowRectView3 = WCYArrowRectView(frame: CGRect(x: 140, y: 160, width: 80, height: 100))
        arrowRectView3.arrowPos = .bottomRight
        self.view.addSubview(arrowRectView3)
        
        let arrowRectView4 = WCYArrowRectView(frame: CGRect(x: 20, y: 280, width: 80, height: 100))
        arrowRectView4.arrowPos = .leftTop
        arrowRectView4.arrowWidth = 25
        arrowRectView4.arrowHeight = 10
        self.view.addSubview(arrowRectView4)
        
        let arrowRectView5 = WCYArrowRectView(frame: CGRect(x: 140, y: 280, width: 80, height: 100))
        arrowRectView5.arrowPos = .leftBottom
        arrowRectView5.arrowWidth = 25
        arrowRectView5.arrowHeight = 10
        arrowRectView5.fillColor = UIColor.gray
        self.view.addSubview(arrowRectView5)
        
        let arrowRectView6 = WCYArrowRectView(frame: CGRect(x: 20, y: 400, width: 80, height: 100))
        arrowRectView6.arrowPos = .rightTop
        arrowRectView6.arrowWidth = 25
        arrowRectView6.arrowHeight = 10
        arrowRectView6.corner = 10
        arrowRectView6.dotLineSpace = 0
        arrowRectView6.strokeWidth = 6
        arrowRectView6.strokeColor = UIColor.red
        arrowRectView6.fillColor = UIColor(red: 219/255.0, green: 249/255.0, blue: 149/255.0, alpha: 1.0)
        self.view.addSubview(arrowRectView6)
        
        let arrowRectView7 = WCYArrowRectView(frame: CGRect(x: 140, y: 400, width: 150, height: 100))
        arrowRectView7.arrowPos = .rightBottom
        arrowRectView7.arrowWidth = 25
        arrowRectView7.arrowHeight = 10
        arrowRectView7.arrowOffset = 37.5
        arrowRectView7.corner = 10
        arrowRectView7.dotLineSpace = 0
        arrowRectView7.strokeWidth = 0
        arrowRectView7.strokeColor = UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        arrowRectView7.fillColor = UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        self.view.addSubview(arrowRectView7)
        
        let arrowRectView8 = WCYArrowRectView(frame: CGRect(x: 20, y: 520, width: 80, height: 100))
        arrowRectView8.arrowPos = .leftMiddle
        arrowRectView8.arrowWidth = 20
        arrowRectView8.arrowHeight = 10
        self.view.addSubview(arrowRectView8)
        
        let arrowRectView9 = WCYArrowRectView(frame: CGRect(x: 140, y: 520, width: 80, height: 100))
        arrowRectView9.arrowPos = .rightMiddle
        arrowRectView9.arrowWidth = 20
        arrowRectView9.arrowHeight = 10
        self.view.addSubview(arrowRectView9)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

